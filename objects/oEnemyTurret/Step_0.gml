//Calculate time passed + distance once
var dt = delta_time / 1000000;
if(instance_exists(oPlayerSpaceship)) {
	var dist = point_distance(x, y, oPlayerSpaceship.x, oPlayerSpaceship.y);
}
else {
	var dist = 999	
}
//Rotate back to base angle if player too far
var desiredAngle = baseAngle;
var canAim = false;
//Enter pewpew mode if player is close enough (rotate barrel + activate shooting)
if (dist <= detectionRange)
{
    if (instance_exists(oPlayerSpaceship)) {
		var targetAngle = point_direction(x, y, oPlayerSpaceship.x, oPlayerSpaceship.y);
	}
	else { 
		var targetAngle = 0
	}
	var offsetFromBase = angle_difference(targetAngle, baseAngle);
    offsetFromBase = clamp(offsetFromBase, -rotationLimit, rotationLimit);
    desiredAngle = baseAngle + offsetFromBase;
    canAim = true;
}
//Switch based on current state
switch (currentState)
{
	//Tracking + reduce 5 second cooldown between shots
    case TurretState.TRACKING:
        if (canAim)
        {
            var toMove = angle_difference(desiredAngle, barrelAngle);
            var maxStep = rotationSpeed * dt;
            toMove = clamp(toMove, -maxStep, maxStep);
            barrelAngle += toMove;
            fireTimer -= dt;
            if (fireTimer <= 0)
            {
                currentState = TurretState.CHARGING;
                preFireTimer = preFireDelay;
            }
        }
    break;
	//Stop rotating barrel and charge for preFireTimer seconds then shoot
    case TurretState.CHARGING:
        preFireTimer -= dt;
        if (preFireTimer <= 0)
        {
            var tipX = x + lengthdir_x(sprite_width / 2, barrelAngle);
            var tipY = y + lengthdir_y(sprite_width / 2, barrelAngle);
            var bullet = instance_create_depth(tipX, tipY, 0, oEnemyTurretBullet);
            bullet.direction = barrelAngle;
            bullet.speed = bulletSpeed;
            fireTimer = fireCooldown;
            currentState = TurretState.TRACKING;
        }

    break;
}