/// @description Initialize variables

cameraWidth = view_wport[0]
cameraHeight = view_hport[0]

enum joystickPermutations
{
	LEFT,
	IDLE,
	RIGHT
}

//How far do we want the joystick to be able to move from the center
maxJoystickDistance = 70

//Variables for joystick one
joystickOneBaseX = cameraWidth/4
joystickOneBaseY = cameraHeight - 96

joystickOneCurrX = joystickOneBaseX
joystickOneCurrY = joystickOneBaseY

joystickOneFactor = 0
joystickOneAngle = 0

//Variables for joystick two
joystickTwoBaseX = 3 * cameraWidth/4
joystickTwoBaseY = joystickOneBaseY

joystickTwoCurrX = joystickTwoBaseX
joystickTwoCurrY = joystickTwoBaseY

joystickTwoFactor = 0
joystickTwoAngle = 0

//Variable for input devices (touches)
devicePerm[0] = joystickPermutations.IDLE
devicePerm[1] = joystickPermutations.IDLE

//Variables for fuelbar
fuelBarXOffset = 16
fuelBarYOffset = 16
fuelBarStartingX = 18 //How many pixels from the left side does the full bar start
fuelBarStartingY = 15 //How many pixels from the top does the full bar start

