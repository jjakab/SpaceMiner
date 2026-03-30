// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function transitionCameraGet(){

	/*This function is called when the room is transitioning, and will keep the camera 'stable' and fixed
	on blackholes from one level to the next */
	
	if(instance_exists(oPlayerDisappearEffect)) {
	
		transitionXOffset = oPlayerDisappearEffect.x - camera_get_view_x(view_camera[0])
		transitionYOffset = oPlayerDisappearEffect.y - camera_get_view_y(view_camera[0])
		
	}
	
}