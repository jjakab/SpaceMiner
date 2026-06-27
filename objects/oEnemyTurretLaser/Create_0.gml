/// @description Orient based on direction and initialize variables
event_inherited()

//We draw the 'standard' barrel for this turret
barrelSprite = sTurretBarrelLaser

//When this turret fires, it creates a bullet
turretShoot = function() {
	
    //Spawn laser from the end of the repositioned barrel
    var barrelX = x + lengthdir_x(barrelPivotOffset, image_angle)
    var barrelY = y + lengthdir_y(barrelPivotOffset, image_angle)
	var laser = instance_create_layer(barrelX, barrelY, "Ships", oEnemyLaserMain, { index : barrelAngle, parentID : noone, creatingInstance: id, currentIteration : 0})	
    fireTimer = max(.1, fireCooldown + random_range(-fireCooldownJitter, fireCooldownJitter));
    currentState = TurretState.TRACKING;
	turretCharging = false
	barrelImageIndex = 0
	
}

