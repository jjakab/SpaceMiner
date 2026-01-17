/// @description Initialize variables

cameraWidth = view_wport[0]
cameraHeight = view_hport[0]

//How far do we want the joystick to be able to move from the center
maxJoystickDistance = 50

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

