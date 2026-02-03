// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rotateTowardsPlayer(turnSpeed){
	
	var angleToPlayer = point_direction(x,y,oPlayerSpaceship.x,oPlayerSpaceship.y)
	var angleDiff = angle_difference(image_angle,angleToPlayer)
	
	if(abs(angleDiff) > turnSpeed) image_angle -= sign(angleDiff) * turnSpeed else image_angle = angleToPlayer
}