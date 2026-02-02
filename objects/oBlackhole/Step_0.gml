/// @description Insert description here


//Determine if this is visible for the first time, and shake the screen if so
var cam = view_camera[0]

var x1 = camera_get_view_x(cam)
var y1 = camera_get_view_y(cam)
var x2 = camera_get_view_width(cam) + x1
var y2 = camera_get_view_height(cam) + y1

var isVisible = point_in_rectangle(x,y,x1,y1,x2,y2)

if(isVisible and (hasShakenScreen = false)) {
	screenshake(150,3,.1)
	hasShakenScreen = true
}
