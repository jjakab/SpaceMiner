// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shootLaser(laserIndex,offsetLength,offsetAngle){

	draw_set_color(c_white)

	//PLACEHOLDER
	var solid_object = oGUI;
	
	var laserOneXOrigin = x + lengthdir_x(offsetLength,image_angle + offsetAngle)
	var laserOneYOrigin = y + lengthdir_y(offsetLength,image_angle + offsetAngle)

	var hitObj = false
	for(var i = 0; i < laserLengthCap[laserIndex]; i++){

	    var lx = laserOneXOrigin + lengthdir_x(i, image_angle);
	    var ly = laserOneYOrigin + lengthdir_y(i, image_angle);

	    if(collision_point(lx, ly, solid_object, false, true)){
	        //LOGIC FOR LASER HITTING OBJECT
			var hitObj = true
			break;
	    }

	}
	if(hitObj = false) currLaserLength[laserIndex] = min(laserLengthCap[laserIndex],currLaserLength[laserIndex] + laserIncrementRate[laserIndex])
	
	var height = abs((laserFrequency / 2) - alarm[0]) / laserFrequency
	draw_set_color(c_white);
	draw_line_width(laserOneXOrigin, laserOneYOrigin, laserOneXOrigin + lengthdir_x(currLaserLength[laserIndex], image_angle), laserOneYOrigin + lengthdir_y(currLaserLength[laserIndex], image_angle), (height * laserWidth[laserIndex]) + 1);
	draw_sprite_ext(sLaserCap, height, laserOneXOrigin + lengthdir_x(currLaserLength[laserIndex], image_angle),laserOneYOrigin + lengthdir_y(currLaserLength[laserIndex], image_angle),1,1,image_angle,c_white,1)

}