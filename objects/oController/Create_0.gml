/// @description Initialize variables, spawn objects

randomize()

//Spawn edge walls

var wallWidth = sprite_get_height(sTerrainEdge1)

	//Top and bottom row
	for (var i = 1; i < ((room_width - wallWidth) / wallWidth); i++) {
		
		var topWall = instance_create_depth(i * wallWidth,0,0,oTerrainEdge)
		with(topWall) image_angle = 270;
		
		var bottomWall = instance_create_depth(i * wallWidth,room_height,0,oTerrainEdge)
		with(bottomWall) image_angle = 90;
		
	}
	
	//Top and bottom row
	for (var i = 0; i < room_height / wallWidth; i++) {
		
		var leftWall = instance_create_depth(0,i * wallWidth,0,oTerrainEdge)
		
		
		var rightWall = instance_create_depth(room_width,i * wallWidth,0,oTerrainEdge)
		with(rightWall) image_angle = 180;
		
	}



//Stars
var starDensityWidth = 30 // how many 'columns' of stars
var starDensityHeight = 30 // how many 'rows' of stars

var cellWidth = room_width / starDensityWidth
var cellHeight = room_height / starDensityHeight

//Spawn stars based on width and height
//Something is wrong with this, doesn't spawn in last column
for (var i = 0; i < room_width / starDensityWidth; i++) {
	for (var j = 0; j < room_height / starDensityHeight; j++) {
			instance_create_depth((i * cellWidth) + round(random(cellWidth)),(j * cellHeight) + round(random(cellHeight)),0,oStar)
	}
}
