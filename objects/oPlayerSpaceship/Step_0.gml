/// @description Movement, etc.

//Get info about joysticks from GUI object - i have zero clue why it has to be negative
leftAngle = -1 * oGUI.joystickOneAngle
leftFactor = oGUI.joystickOneFactor

rightAngle = -1 * oGUI.joystickTwoAngle
rightFactor = oGUI.joystickTwoFactor

//Change the player angle if the right joystick is being used, then shoot a laser
if(rightFactor > 0) {
	
	var angleDiff = angle_difference(image_angle,rightAngle)
	if(abs(angleDiff) > maxSpinSpeed) image_angle -= sign(angleDiff) * maxSpinSpeed else image_angle = rightAngle
	
}
else {
	for (var i = 0; i < numLasers; i++) {
		currLaserLength[i] = max(0,currLaserLength[i] - laserIncrementRate[i])
	}
}

//If the left joystick is being used, adjust the player's speed
if(leftFactor > 0) {
	xSpeed += accelerationSpeed * lengthdir_x(leftFactor,leftAngle)
	ySpeed += accelerationSpeed * lengthdir_y(leftFactor,leftAngle)
}

//Regardless of whether the left joystick is being used, we slow the player
xSpeed = xSpeed * slowFactor
ySpeed = ySpeed * slowFactor

//Move the player based on xSpeed/ySpeed
x += xSpeed
y += ySpeed

//Round player's position to nearest clean pixel
/*x = round(trueX)
y = round(trueY)
/*
