// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shootLaserAtPlayer(){

	draw_set_color(c_white)
	
	//Calculate the origin of the laser within the player sprite - this makes them emit from the cannons
	var laserOneXOrigin = x + lengthdir_x(4,image_angle)
	var laserOneYOrigin = y + lengthdir_y(4,image_angle) + 0.5

	//Start off by assuming the laser does not hit an object
	var hitObj = false
	
	var lx = 0
	var ly = 0
	
	var i = 0
	
	//Iterate over pixels in laser range, stop upon reaching current max range or an object
	for(i = 0; i < currLaserLength; i++){

	    lx = laserOneXOrigin + lengthdir_x(i, image_angle);
	    ly = laserOneYOrigin + lengthdir_y(i, image_angle);

		//Check if we hit an object
	    if(collision_point(lx, ly, oTerrainMaster, false, true)){
			
			//NEED LOGIC FOR HITTING PLAYER
			
			hitObj = true;
			break;
	    }

	}
	
	//If we did not hit an object, laser length increases (up to the cap)
	if(hitObj = false) currLaserLength = min(laserLengthCap,currLaserLength + laserIncrementRate)

	//The laser may not be able to go up to the current laser length cap - we calculate the percentage that it was stopped at	
	var laserLengthFactor = i / currLaserLength
	
	//sine height for laser modulation
	var height = abs((laserFrequency / 2) - alarm[0]) / laserFrequency
	
	//Draw the laser along with the 'cap'
	draw_line_width(laserOneXOrigin, laserOneYOrigin, laserOneXOrigin + lengthdir_x(laserLengthFactor * currLaserLength, image_angle), laserOneYOrigin + lengthdir_y(laserLengthFactor * currLaserLength, image_angle), (height * laserWidth) + 1);
	draw_sprite_ext(sLaserCap, height, laserOneXOrigin + lengthdir_x(laserLengthFactor * currLaserLength, image_angle),laserOneYOrigin + lengthdir_y(laserLengthFactor * currLaserLength, image_angle),1,1,image_angle,c_white,1)

}