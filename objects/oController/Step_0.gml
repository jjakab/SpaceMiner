/// @description Manipulate fog of war

//INSTANCE DEACTIVATION/REACTIVATION CODE
/*
instance_activate_all()
//instance_deactivate_region(view_xport[0] - 64, view_yport[0] - 64, view_wport[0] + 128, view_hport[0] + 128,false, false)

instance_deactivate_region(camera_get_view_x(view_camera[0]) - 64, camera_get_view_y(view_camera[0]) - 64, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 64, camera_get_view_height(view_camera[0]) + camera_get_view_y(view_camera[0]) + 64,false, false)
instance_activate_object(oGUI)
instance_activate_object(oCamera)

*/

//Update fog of war
if(instance_exists(oPlayerSpaceship)) {
	
	//Re-calculate player position within grid
	var newXGridPos = floor(oPlayerSpaceship.x / fogWidth)
	var newYGridPos = floor(oPlayerSpaceship.y / fogWidth)
	
	//Check if this position is different from the position last frame
	if((newXGridPos != playerGridPositionX) || (newYGridPos != playerGridPositionY)) {
	
		//Position has changed - destroy fog of war
		destroyFogOfWarGrid(newXGridPos,newYGridPos)
		
		//Update the player's location
		playerGridPositionX = newXGridPos
		playerGridPositionY = newYGridPos
	
	}
	
}