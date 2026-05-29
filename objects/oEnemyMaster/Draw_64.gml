/// @description Draw prox arrow if necessary

//If there is no player, we don't do anything
if(!instance_exists(oPlayerSpaceship)) {
	exit;
}

//Calculate distance from each screen buffer
leftDistance = camera_get_view_x(view_camera[0]) - x
rightDistance = x - (camera_get_view_x(view_camera[0]) + cameraWidth)
topDistance = camera_get_view_y(view_camera[0]) - y
bottomDistance = y - (camera_get_view_y(view_camera[0]) + cameraHeight - guiHeight)

//If the smallest of the distances is less than minProxDistance, no need to draw arrows
if(max(leftDistance,rightDistance,topDistance,bottomDistance) < minProxDistance) {
	exit
}

//Start off by assuming we draw a right arrow
var arrowDir = 0
var maxDistanceCounter = rightDistance

//Check other distances, if they're lower than the max and further than the current, set them to the new max
if((topDistance < maxProxDistance) and (topDistance > maxDistanceCounter)) {
	arrowDir = 1
	maxDistanceCounter = topDistance
}
if((leftDistance < maxProxDistance) and (leftDistance > maxDistanceCounter)) {
	arrowDir = 2
	maxDistanceCounter = leftDistance
}
if((bottomDistance < maxProxDistance) and (bottomDistance > maxDistanceCounter)) {
	arrowDir = 3
	maxDistanceCounter = bottomDistance
}

proxSpriteIndex = floor( (maxDistanceCounter - minProxDistance) / proxInterval)

//Declare arrow coordinates
var arrowX = 0
var arrowY = 0

//Set arrow coordinates depending on max distance
if(arrowDir = 0) {
	arrowX = viewportWidth
	arrowY = (y - view_get_yport(view_camera[0])) * (view_get_wport(view_camera[0]) / camera_get_view_width(view_camera[0]))
}
else if (arrowDir = 1) {
	arrowX = (x - view_get_xport(view_camera[0])) * (view_get_hport(view_camera[0]) / camera_get_view_height(view_camera[0]))
	arrowY = 0
}
else if(arrowDir = 2) {
	arrowX = 0
	arrowY = (y - view_get_yport(view_camera[0])) * (view_get_wport(view_camera[0]) / camera_get_view_width(view_camera[0]))
}
else if (arrowDir = 3) {
	arrowX = (x - view_get_xport(view_camera[0])) * (view_get_hport(view_camera[0]) / camera_get_view_height(view_camera[0]))
	arrowY = viewportHeight
}

draw_sprite_ext(arrowSprite,proxSpriteIndex,arrowX,arrowY,1,1,arrowDir * 90,c_white,1)