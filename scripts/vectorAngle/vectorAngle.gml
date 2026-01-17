// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function vectorAngle( x1, y1, x2, y2){

	//Given two coordinates, return the difference in degrees
	return arctan2(y2-y1, x2-x1) * (180/pi)

}