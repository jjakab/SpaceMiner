// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function isVisible(xBuffer,yBuffer)  {
	
	//Determine if this is visible on screen + buffer area
	var cam = view_camera[0]

	var x1 = camera_get_view_x(cam)
	var y1 = camera_get_view_y(cam)
	var x2 = camera_get_view_width(cam) + x1
	var y2 = camera_get_view_height(cam) + y1

	return point_in_rectangle(x,y,x1-xBuffer,y1-yBuffer,x2+xBuffer,y2+yBuffer)
	
}