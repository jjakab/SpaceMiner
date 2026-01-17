/// @description Movement, etc.

//Get info about joysticks from GUI object - i have zero clue why it has to be negative
leftAngle = -1 * oGUI.joystickOneAngle
leftFactor = oGUI.joystickOneFactor

rightAngle = -1 * oGUI.joystickTwoAngle
rightFactor = oGUI.joystickTwoFactor

//Change the player angle if the right joystick is being used, then shooter a laser
if(rightFactor > 0) {
	
	var angleDiff = angle_difference(image_angle,rightAngle)
	if(abs(angleDiff) > maxSpinSpeed) image_angle -= sign(angleDiff) * maxSpinSpeed
	
}
else {
	for (var i = 0; i < numLasers; i++) {
		currLaserLength[i] = max(0,currLaserLength[i] - laserIncrementRate[i])
	}
}

