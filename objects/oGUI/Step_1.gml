/// @description Detect touches

//Detect two touches max
var maxDevices = 2;

//Start off by assuming neither joystick is used
var leftTouch = false
var rightTouch = false

for (var i = 0; i < maxDevices; i++)
{
        var touchX = device_mouse_x_to_gui(i);
        var touchY = device_mouse_y_to_gui(i);
        
		if(device_mouse_check_button(i,mb_left)) {
			//Check if press is on left side of screen - this means it's for joystick one
	        if ((touchX > 0) and (touchX < (cameraWidth / 2))) {
				
				//Note that left joystick is being used
				leftTouch = true
		
				//Get the angle between the base and curr position - we use a custom function for this because touch position is measured relative to GUI layer
				var joystickAngle = vectorAngle(joystickOneBaseX,joystickOneBaseY,touchX,touchY)
			
				//Get the distance between the base and curr position
				var joystickDistance = sqrt(sqr(joystickOneBaseX - touchX) + sqr(joystickOneBaseY - touchY))
			
				//Set the current position of the joystick based on the angle and distance
				joystickOneCurrX = joystickOneBaseX + (min(maxJoystickDistance,joystickDistance) * cos(degtorad(joystickAngle)))
				joystickOneCurrY = joystickOneBaseY + (min(maxJoystickDistance,joystickDistance) * sin(degtorad(joystickAngle)))
				
				joystickOneFactor = max(1,abs(joystickDistance),maxJoystickDistance)
				joystickOneAngle = joystickAngle

			}
			
			//Check if press is on the right side of the screen - this means it's for joystick two
			else if ((touchX > 0) and (touchX > (cameraWidth / 2))) {
		
				//Note that left joystick is being used
				rightTouch = true
		
				//Get the angle between the base and curr position - we use a custom function for this because touch position is measured relative to GUI layer
				var joystickAngle = vectorAngle(joystickTwoBaseX,joystickTwoBaseY,touchX,touchY)
			
				//Get the distance between the base and curr position
				var joystickDistance = sqrt(sqr(joystickTwoBaseX - touchX) + sqr(joystickTwoBaseY - touchY))
			
				//Set the current position of the joystick based on the angle and distance
				joystickTwoCurrX = joystickTwoBaseX + (min(maxJoystickDistance,joystickDistance) * cos(degtorad(joystickAngle)))
				joystickTwoCurrY = joystickTwoBaseY + (min(maxJoystickDistance,joystickDistance) * sin(degtorad(joystickAngle)))
				
				joystickTwoFactor = max(1,abs(joystickDistance),maxJoystickDistance)
				joystickTwoAngle = joystickAngle

			}
			
		}
		
		//If one joystick wasn't used, reset the position
		
		if(leftTouch = false) {
			
			joystickOneCurrX = joystickOneBaseX
			joystickOneCurrY = joystickOneBaseY
			
			joystickOneFactor = 0
			joystickOneAngle = -1
			
		}
		if(rightTouch = false) {
			
			joystickTwoCurrX = joystickTwoBaseX
			joystickTwoCurrY = joystickTwoBaseY
		
			joystickTwoFactor = 0
			joystickTwoAngle = -1
		
		}
		
		
		
}