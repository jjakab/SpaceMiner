// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnTerrain(){

	var blockWidth = 16

	//Generate random x-location and y-location divisible by our block width
	var xLoc = irandom(room_width / blockWidth) * blockWidth
	var yLoc = irandom(room_height / blockWidth) * blockWidth

	//FOR TESTING
	xLoc = 160
	yLoc = 160


	//How many times will we walk aka how many clusters of terrain exist
	var walkIterations = 8
	
	//Per walk, how many times do we step
	var stepIterations = 100
	var walkDirection = random_range(0,3)
	
	//Outer loop for walks
	for (var j = 0; j < walkIterations; j++) {
		
		//Set the starting location to a random one
		xLoc = irandom(room_width / blockWidth) * blockWidth
		yLoc = irandom(room_height / blockWidth) * blockWidth
		
		//Within each walk, we take a certain number of steps
		for (var i = 0; i < stepIterations; i++) {
		
			//Generate a random direction
			walkDirection = irandom_range(0,3)
		
			//Move in the random direction, beholden to limits around the edges
			if(walkDirection = 0) xLoc = min(room_width - blockWidth, xLoc + blockWidth) // Move east
			else if(walkDirection = 1) yLoc = max(blockWidth, yLoc - blockWidth) // Move north
			else if(walkDirection = 2) xLoc = max(blockWidth, xLoc - blockWidth) // Move west
			else if(walkDirection = 3) yLoc = min(room_height - blockWidth, yLoc + blockWidth) // Move south
		
			if(position_meeting(xLoc,yLoc,oTerrainLarge)) show_debug_message("iteration " + string(i) + ": block here")
			else {
				instance_create_depth(xLoc,yLoc,0,oTerrainLarge)
				show_debug_message("iteration " + string(i) + ": PLACED BLOCK AT " + string(xLoc) + ", " + string(yLoc))
			}
		
		}
	}
	
}