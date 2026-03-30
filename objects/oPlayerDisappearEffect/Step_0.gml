/// @description Teleport to next room if conditions are met
var blackHoleSync = false
if(instance_exists(oBlackhole)) {
	if(oBlackhole.image_index >= (oBlackhole.image_number - 1)) {
		blackHoleSync = true	
	}
}

//Check if animation of this and blackhole is over
if(animationOver = true and blackHoleSync = true) {

	//Call a script for camera to store relative screen offset of blackhole
	with(oCamera) {
		transitionCameraGet()	
	}

	//TP to next room, destroy this obj
	if(tpRoom != noone) {
		room_goto(tpRoom)	
	}
	instance_destroy()
	
}
