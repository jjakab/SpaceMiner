/// @description Initialize drone behavior

enum DroneState
{
    PATROL,
    STRAFE,
    REPOSITION,
    DISABLED
}

currentState = DroneState.PATROL

damageable = true
hp = 6

//Movement settings
moveSpeed = 0.9
turnSpeed = 2
disabledTurnSpeed = 8

//Combat spacing
activationRange = 220
preferredMinRange = 72
preferredMaxRange = 140
strafeDirection = choose(-1, 1)
strafeRetargetTimer = 0
strafeRetargetDuration = 0.9
fireCooldown = 1.4
fireTimer = fireCooldown * random(1)
bulletSpeed = 1.8
shootRange = 170

//Patrol settings
patrolAnchor = noone
patrolRadius = 32
patrolRetargetTimer = 0
patrolRetargetDuration = 2
patrolTarget = { x: x, y: y }

//Fallback behavior when the drone loses position
repositionTimer = 0
repositionDuration = 0.8
repositionTarget = { x: x, y: y }

//Stun window after being hit
disabledTimer = 0
disabledDuration = 0.6

image_angle = irandom(359)

if (instance_exists(oTerrainOre))
{
    patrolAnchor = instance_nearest(x, y, oTerrainOre)
}

if (patrolAnchor != noone)
{
    var patrolAngle = irandom(359)
    patrolTarget.x = patrolAnchor.x + lengthdir_x(patrolRadius, patrolAngle)
    patrolTarget.y = patrolAnchor.y + lengthdir_y(patrolRadius, patrolAngle)
}
