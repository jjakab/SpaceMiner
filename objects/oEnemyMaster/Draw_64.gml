/// @description Draw prox arrow if necessary

//If there is no player, we don't do anything
if(!instance_exists(oPlayerSpaceship) or (showsProxArrow = false)) {
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

switch(arrowDir)
{
	case 0:
		arrowX = viewportWidth - borderDistance
		arrowY = (y - camera_get_view_y(view_camera[0])) * hScale
	break;
	
	case 1:
		arrowX = (x - camera_get_view_x(view_camera[0])) * wScale
		arrowY = borderDistance
	break;
	
	case 2:
		arrowX = borderDistance
		arrowY = (y - camera_get_view_y(view_camera[0])) * hScale
	break;
	
	case 3:
		arrowX = (x - camera_get_view_x(view_camera[0])) * wScale
		arrowY = viewportHeight - borderDistance
	break;
}

draw_sprite_ext(arrowSprite,numFrames - proxSpriteIndex - 1,arrowX,arrowY,1,1,arrowDir * 90,c_white,1)