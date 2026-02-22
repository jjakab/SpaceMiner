var dist = point_distance(x, y, oPlayerSpaceship.x, oPlayerSpaceship.y);
//Rotate back to base angle if player too far
var desiredAngle = baseAngle;
var canAim = false;
//Enter pewpew mode if player is close enough (rotate barrel + activate shooting)
if (dist <= detectionRange)
{
    var targetAngle = point_direction(x, y, oPlayerSpaceship.x, oPlayerSpaceship.y);
    var offsetFromBase = angle_difference(targetAngle, baseAngle);
    offsetFromBase = clamp(offsetFromBase, -rotationLimit, rotationLimit);
    desiredAngle = baseAngle + offsetFromBase;
    canAim = true;
}
//Calculating the total angle for base to where player is
var toMove = angle_difference(desiredAngle, barrelAngle);
var maxStep = rotationSpeed * (delta_time / 1000000);
//Clamp so that we rotate smoothly 
toMove = clamp(toMove, -maxStep, maxStep);
barrelAngle += toMove;
//If we can shoot at the player, shoot (only reduce timer when player visible? design choice)
if (canAim)
{
    fireTimer -= delta_time / 1000000;
    if (fireTimer <= 0)
    {
        fireTimer = fireCooldown;

        var tipX = x + lengthdir_x(sprite_width / 2, barrelAngle);
        var tipY = y + lengthdir_y(sprite_width / 2, barrelAngle);
        var bullet = instance_create_depth(tipX, tipY, 0, oEnemyTurretBullet);

        bullet.direction = barrelAngle;
        bullet.speed = bulletSpeed;
    }
}