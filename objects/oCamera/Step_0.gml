/// @description Update camera position

//Screenshake if applicable
if (shake)
{
	
	//Decrement the time we're shaking
	shakeTime -= 1
	
	//Choose shake variables of magnitude and random direction
	var xVal = choose(-shakeMagnitude,shakeMagnitude)
	var yVal = choose(-shakeMagnitude,shakeMagnitude)
	
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]) + xVal,camera_get_view_y(view_camera[0]) + yVal)
	
	if(shakeTime <=0) {
		shakeMagnitude -= shakeFade
		
		if(shakeMagnitude <= 0) {
			shake = false	
		}
		
		
	}
	
}