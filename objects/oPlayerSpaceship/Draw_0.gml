/// @description Draw relevant parts of ship

//If right joystick is being used, draw a laser
if(rightFactor > 0) {	
	
	//Shoot laser from both cannons
	for (var i = 0; i < numLasers; i++) {
		shootLaser(i,laserOffsetLength[i], laserOffsetAngle[i])
	}
	
}

//Draw self
draw_self()

