/// @description Draw the GUI elements

//Draw the left joystick
	draw_sprite_ext(sJoystickOne,0,joystickOneBaseX,joystickOneBaseY,1,1,0,c_white,1)
	draw_sprite_ext(sSmallJoystickOne,0,joystickOneCurrX,joystickOneCurrY,1,1,0,c_white,1)

//Draw the right joystick
	draw_sprite_ext(sJoystickOne,0,joystickTwoBaseX,joystickTwoBaseY,1,1,0,c_white,1)
	draw_sprite_ext(sSmallJoystickOne,0,joystickTwoCurrX,joystickTwoCurrY,1,1,0,c_white,1)

//Draw the fuel bar
	draw_sprite(sFuelBarBackground,0,fuelBarXOffset,fuelBarYOffset)
	draw_sprite_ext(sFuelBarBracket,0,fuelBarXOffset,fuelBarYOffset,1,1,0,c_white,1)
	draw_sprite_ext(sFuelBarEmpty,0,fuelBarXOffset,fuelBarYOffset,1,1,0,c_white,1)

	//Calculate
	var fullWidth = sprite_get_width(sFuelBarFull) - (fuelBarStartingX * 2) - (( 3 / 100) * (sprite_get_width(sFuelBarFull) - (fuelBarStartingX * 2)))

	draw_sprite_part(sFuelBarFullCropped,0,0,0,89,sprite_get_height(sFuelBarFullCropped),fuelBarXOffset+fuelBarStartingX,fuelBarYOffset+fuelBarStartingY)