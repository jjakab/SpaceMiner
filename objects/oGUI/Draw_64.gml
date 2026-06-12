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

	//Calculate fuel ratio (only if player exists)
	if(instance_exists(oPlayerSpaceship)) fuelRatio = oPlayerSpaceship.currentFuel / oPlayerSpaceship.maxFuel
	else { fuelRatio = 1 }

	draw_sprite_part(sFuelBarFullCropped,0,0,0,fuelRatio * fullWidth,sprite_get_height(sFuelBarFullCropped),fuelBarXOffset+fuelBarStartingX,fuelBarYOffset+fuelBarStartingY)

//Draw the iteration counter
draw_set_font(fGUI)
draw_set_halign(fa_middle)
draw_set_valign(fa_top)
draw_text(view_get_wport(view_camera[0]) - fullWidth,fuelBarYOffset,"Iteration " + string(global.playerCurrentRoom))

	
//Draw the pause button
	draw_sprite_ext(sPauseButton,0,view_get_wport(view_camera[0])-sprite_get_width(sPauseButton),0,1,1,0,c_white,1)



//STATS FOR TESTING
/*
draw_text(5,300,"Large Terrain Count: " + string(instance_number(oTerrainLarge)))
draw_text(5,350,"Mini Count: " + string(instance_number(oTerrainMiniFrame)))