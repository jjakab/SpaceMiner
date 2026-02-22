/// @description Orient based on direction and initialize variables
event_inherited()
//We set the baseAngle in spawnTurret() script, double check to ensure it exists
if (!variable_instance_exists(id, "baseAngle"))
{
    baseAngle = image_angle;
}
barrelAngle = baseAngle;
rotationLimit = 80;
//Max rotation per second
rotationSpeed = 20;
detectionRange = 300;

//Shooting variables
fireCooldown = 5;
fireTimer = 0;
bulletSpeed = 3; 