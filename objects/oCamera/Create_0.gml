/// @description Initialize variables

//If this somehow got duplicated, destroy it
if(instance_number(oController) > 1) instance_destroy(id,false)

//Screenshake
shake = false
shakeTime = 0
shakeMagnitude = 0
shakeFade = 0.25

//Variables used when transitioning room
transitionXOffset = 0
transitionYOffset = 0

//Focus on the player appear effect
if(instance_exists(oPlayerAppearEffect)) {
	camera_set_view_pos(view_camera[0],oPlayerAppearEffect.x - camera_get_view_width(view_camera[0]) / 2,oPlayerAppearEffect.y - camera_get_view_height(view_camera[0]) / 2)	
}