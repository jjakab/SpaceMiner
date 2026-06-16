/// @description Orient based on direction and initialize variables
event_inherited()

//Set hp and max hp
hp = 50
maxHp = hp

//We only want to change frame upon damage
image_speed = 0

//We set the baseAngle in spawnTurret() script, double check to ensure it exists
if (!variable_instance_exists(id, "baseAngle"))
{
    baseAngle = image_angle;
}
enum TurretState {
    TRACKING,
    CHARGING,
    AIMING
}

//We don't want this showing a proximity arrow
showsProxArrow = false

currentState = TurretState.TRACKING;

barrelAngle = baseAngle;
//Move the barrel pivot from the wall edge to the center of the base
barrelPivotOffset = 5
barrelLength = sprite_get_width(sTurretBarrel)
rotationLimit = 80;
//Max rotation per second
rotationSpeed = 30;
detectionRange = 300;

//Shooting variables
fireCooldown = 5;
fireTimer = 0;
bulletSpeed = 3; 
preFireDelay = 1.5;
preFireTimer = 0;
isCharging = false;

//Damage display variables
damageFrames = sprite_get_number(sTurretBaseDamaged)
randYScale = choose(-1,1)

//Set an alarm to change barrel angle
alarm_set(0,1)
