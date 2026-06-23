/// @description Orient based on direction and initialize variables
event_inherited()

//We draw the 'standard' barrel for this turret
barrelSprite = sTurretBarrel

//When this turret fires, it creates a bullet
turretShoot = function() {
	
    //Spawn bullets from the end of the repositioned barrel
    var barrelX = x + lengthdir_x(barrelPivotOffset, image_angle)
    var barrelY = y + lengthdir_y(barrelPivotOffset, image_angle)
    var tipX = barrelX + lengthdir_x(barrelLength, barrelAngle);
    var tipY = barrelY + lengthdir_y(barrelLength, barrelAngle);
    var bullet = instance_create_layer(tipX, tipY, "Ships", oEnemyTurretBullet);
    bullet.direction = barrelAngle + random_range(-shotAngleJitter, shotAngleJitter);
    bullet.speed = bulletSpeed;
    fireTimer = max(.1, fireCooldown + random_range(-fireCooldownJitter, fireCooldownJitter));
    currentState = TurretState.TRACKING;
	turretCharging = false
	barrelImageIndex = 0
	
}