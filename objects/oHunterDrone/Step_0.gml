/// @description Update drone state

//Store player info and reset frame movement
var dt = delta_time / 1000000
var playerExists = instance_exists(oPlayerSpaceship)
var playerDist = 1000000
var droneXSpeed = 0
var droneYSpeed = 0
var shouldReposition = false

if (playerExists)
{
    playerDist = point_distance(x, y, oPlayerSpaceship.x, oPlayerSpaceship.y)
}

//Count down shared fire cooldown once per frame
fireTimer -= dt

switch (currentState)
{
    //Drift around an ore node until the player gets close
    case DroneState.PATROL:
        patrolRetargetTimer -= dt

        //Patrol points are chosen on a small circle around the anchor ore node
        if (patrolAnchor != noone)
        {
            if (!instance_exists(patrolAnchor))
            {
                patrolAnchor = noone
            }
            else if (patrolRetargetTimer <= 0 || point_distance(x, y, patrolTarget.x, patrolTarget.y) < 8)
            {
                var patrolAngle = irandom(359)
                patrolTarget.x = patrolAnchor.x + lengthdir_x(patrolRadius, patrolAngle)
                patrolTarget.y = patrolAnchor.y + lengthdir_y(patrolRadius, patrolAngle)
                patrolRetargetTimer = patrolRetargetDuration
            }
        }
        else
        {
            //If the anchor disappears, stop wandering until we get a new one
            patrolTarget.x = x
            patrolTarget.y = y
        }

        //Turn the patrol target into simple x/y movement for this frame
        var patrolDirection = point_direction(x, y, patrolTarget.x, patrolTarget.y)
        droneXSpeed = lengthdir_x(moveSpeed, patrolDirection)
        droneYSpeed = lengthdir_y(moveSpeed, patrolDirection)
        image_angle = patrolDirection

        //Start combat behavior once the player enters the drone's bubble
        if (playerExists && playerDist <= activationRange)
        {
            currentState = DroneState.STRAFE
            strafeRetargetTimer = strafeRetargetDuration
            strafeDirection = choose(-1, 1)
        }
    break

    //Circle the player and take occasional shots
    case DroneState.STRAFE:
        if (!playerExists)
        {
            currentState = DroneState.PATROL
            patrolRetargetTimer = 0
            break
        }
		//If player goes too far turn off strafe mode
        if (playerDist > activationRange * 1.5)
        {
            currentState = DroneState.PATROL
            patrolRetargetTimer = 0
            break
        }

        strafeRetargetTimer -= dt
        rotateTowardsPlayer(turnSpeed)

        //Start from the player direction, then shift the target out to one side
        var angleToPlayer = point_direction(x, y, oPlayerSpaceship.x, oPlayerSpaceship.y)
        var desiredRange = (preferredMinRange + preferredMaxRange) / 2
        var strafeAngle = angleToPlayer + (90 * strafeDirection)
        //Build a target that sits beside the player instead of directly on top of them
        var strafeTargetX = oPlayerSpaceship.x + lengthdir_x(desiredRange, angleToPlayer + 180) + lengthdir_x(48, strafeAngle)
        var strafeTargetY = oPlayerSpaceship.y + lengthdir_y(desiredRange, angleToPlayer + 180) + lengthdir_y(48, strafeAngle)
        var moveDirection = point_direction(x, y, strafeTargetX, strafeTargetY)
        droneXSpeed = lengthdir_x(moveSpeed, moveDirection)
        droneYSpeed = lengthdir_y(moveSpeed, moveDirection)

        //Fire occasionally while holding a good combat angle
        if (playerDist <= shootRange && fireTimer <= 0 && abs(angle_difference(image_angle, angleToPlayer)) <= 12)
        {
            var bullet = instance_create_depth(x, y, 0, oEnemyTurretBullet)
            bullet.direction = image_angle
            bullet.speed = bulletSpeed
            fireTimer = fireCooldown
        }

        if (playerDist < preferredMinRange || strafeRetargetTimer <= 0)
        {
            //If we get too close or strafe for too long, pick a new attack angle
            shouldReposition = true
        }
    break

    //Pull back to a fresh angle before re-engaging
    case DroneState.REPOSITION:
        if (!playerExists)
        {
            currentState = DroneState.PATROL
            patrolRetargetTimer = 0
            break
        }

        if (playerDist > activationRange * 1.5)
        {
            currentState = DroneState.PATROL
            patrolRetargetTimer = 0
            break
        }

        repositionTimer -= dt
        rotateTowardsPlayer(turnSpeed)

        //The reposition target is picked when we leave strafe or bounce off terrain
        //Move toward the fallback point chosen when we broke off the strafe
        var repositionDirection = point_direction(x, y, repositionTarget.x, repositionTarget.y)
        droneXSpeed = lengthdir_x(moveSpeed * 1.15, repositionDirection)
        droneYSpeed = lengthdir_y(moveSpeed * 1.15, repositionDirection)

        if (repositionTimer <= 0 || point_distance(x, y, repositionTarget.x, repositionTarget.y) < 10)
        {
            //Once we reach the new lane, go back to circling the player
            currentState = DroneState.STRAFE
            strafeRetargetTimer = strafeRetargetDuration
        }
    break

    //Spin in place briefly after taking damage
    case DroneState.DISABLED:
        disabledTimer -= dt
        image_angle += disabledTurnSpeed

        if (disabledTimer <= 0)
        {
            if (playerExists)
            {
                currentState = DroneState.REPOSITION
                repositionTimer = repositionDuration

                var recoverAngle = point_direction(oPlayerSpaceship.x, oPlayerSpaceship.y, x, y) + (30 * strafeDirection)
                repositionTarget.x = x + lengthdir_x(preferredMaxRange, recoverAngle)
                repositionTarget.y = y + lengthdir_y(preferredMaxRange, recoverAngle)
            }
            else
            {
                currentState = DroneState.PATROL
                patrolRetargetTimer = 0
            }
        }
    break
}

if (shouldReposition)
{
    var retreatAngle = point_direction(x, y, oPlayerSpaceship.x, oPlayerSpaceship.y)
    //Place the fallback point behind and to the side of the player
    //Flip the strafe side so the drone does not keep attacking from the same lane
    currentState = DroneState.REPOSITION
    repositionTimer = repositionDuration
    repositionTarget.x = oPlayerSpaceship.x + lengthdir_x(preferredMaxRange + 24, retreatAngle + 180 + (35 * -strafeDirection))
    repositionTarget.y = oPlayerSpaceship.y + lengthdir_y(preferredMaxRange + 24, retreatAngle + 180 + (35 * -strafeDirection))
    strafeDirection *= -1
}

//Resolve terrain one axis at a time like the player ship does
if (currentState != DroneState.DISABLED)
{
    //This helper zeroes x/y movement if the next step would clip into terrain
    var movementResult = resolveTerrainMovement(droneXSpeed, droneYSpeed)
    var hitTerrain = movementResult.hitTerrain
    droneXSpeed = movementResult.xSpeed
    droneYSpeed = movementResult.ySpeed

    if (hitTerrain)
    {
        if (currentState == DroneState.PATROL)
        {
            //Try another point around the ore instead of getting stuck on terrain
            patrolRetargetTimer = 0
        }
        else if (playerExists)
        {
            var terrainRetreatAngle = point_direction(x, y, oPlayerSpaceship.x, oPlayerSpaceship.y)
            //If combat movement hits terrain, fall back and re-enter from a cleaner angle
            currentState = DroneState.REPOSITION
            repositionTimer = repositionDuration
            repositionTarget.x = oPlayerSpaceship.x + lengthdir_x(preferredMaxRange, terrainRetreatAngle + 180 + (45 * -strafeDirection))
            repositionTarget.y = oPlayerSpaceship.y + lengthdir_y(preferredMaxRange, terrainRetreatAngle + 180 + (45 * -strafeDirection))
        }
    }
}

//Apply the resolved movement at the end of the frame
x += droneXSpeed
y += droneYSpeed
