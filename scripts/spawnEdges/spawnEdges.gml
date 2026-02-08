// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnEdges(){

	var wallWidth = sprite_get_height(sTerrainEdge1)

	//Top and bottom row
	for (var i = 1; i < ((room_width - wallWidth) / wallWidth); i++) {
		
		var topWall = instance_create_depth(i * wallWidth,0,0,oTerrainEdge)
		with(topWall) image_angle = 270;
		
		var bottomWall = instance_create_depth(i * wallWidth,room_height,0,oTerrainEdge)
		with(bottomWall) image_angle = 90;
		
	}
	
	//Left and right columns
	for (var i = 0; i < room_height / wallWidth; i++) {
		
		var leftWall = instance_create_depth(0,i * wallWidth,0,oTerrainEdge)
		
		
		var rightWall = instance_create_depth(room_width,i * wallWidth,0,oTerrainEdge)
		with(rightWall) image_angle = 180;
		
	}
	
	//Corners
	var corner = instance_create_depth(0,0,-1,oTerrainEdge)
	with(corner) {
		sprite_index = sTerrainCorner1	
	}


}