/// @description Orient based on direction and initialize variables
event_inherited()

//Blank function for turret shooting
turretShoot = function() {
	
}

turretCharge = function() {
	turretCharging = true
}

//Set hp and max hp
hp = 50
maxHp = hp

//We only want to change frame upon damage
image_speed = 0
turretCharging = false
barrelImageIndex = 0
barrelImageSpeed = 0.1 //When the turret charges, how fast should the image number increment per frame

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

barrelSprite = sTurretBarrel //This will be re-defined in child object
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
fireCooldownJitter = random_range(.5, 1.5);
fireTimer = random(fireCooldownJitter);
bulletSpeed = 3; 
preFireDelay = 1.5;
preFireDelayJitter = random_range(.2, .55);
preFireTimer = 0;
shotAngleJitter = random_range(2, 6);
isCharging = false;

//Damage display variables
damageFrames = sprite_get_number(sTurretBaseDamaged)
randYScale = choose(-1,1)

//Set an alarm to change barrel angle
alarm_set(0,1)
