// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function transitionCameraSet(){

	//If the player appear effect is located, set the camera to focus on it with the specified relative offset
	if(instance_exists(oPlayerAppearEffect) and (transitionXOffset > 0 or transitionYOffset > 0)) {
		var startX = oPlayerAppearEffect.x
		var startY = oPlayerAppearEffect.y
		
		camera_set_view_pos(view_camera[0],startX - transitionXOffset,startY - transitionYOffset)

	}


}