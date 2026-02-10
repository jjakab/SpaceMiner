// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnTerrainHalls(){
	
	
	var hallsPerSide = 50
	var hallMinWidth = 5
	var hallMaxWidth = 7
	
	//Blocks are 16 px wide
	var blockWidth = 16
	
	//DDenote width/height of grid
	var gridWidth = ceil(room_width / blockWidth)
	var gridHeight = ceil(room_height / blockWidth)
	
	//Create grid
	wallGrid = ds_grid_create(gridWidth,gridHeight)
	
	//Start off by assuming every single cell contains a wall
	ds_grid_set_region(wallGrid,0,0,gridWidth,gridHeight,1)
	
	var horizontalWallYPos = 0
	var thisHallWidth = 0
	
	//Outer loop for horizontal wall
	for (var i = 0; i < hallsPerSide; i++) {
		
		//Generate y-grid position of random point on left wall
		horizontalWallYPos = irandom_range(i * (hallsPerSide/gridHeight),(i+1) * (hallsPerSide / gridHeight))
		
		//For testing purposes
		horizontalWallYPos = 2
		
		//Inner loop for each hall
		for (var j = 0; j < gridWidth; j++) {
			
			//Generate a random width for this cell
			thisHallWidth = irandom_range(hallMinWidth,hallMaxWidth)
			
			//Set everything in region to zero to clear it
			ds_grid_set_region(wallGrid,j,horizontalWallYPos,j,horizontalWallYPos+thisHallWidth,0)
			
			//Modulate vertical position by up to 1, subject to bounds
			horizontalWallYPos = clamp(horizontalWallYPos + irandom_range(-1,1),0,gridHeight)
			
		}
		
	}
	
	
	//Create walls for every grid position that is equal to one
	for (var i = 0; i < gridWidth; i++) {
		for (var j = 0; j < gridHeight; j++) {
			if(ds_grid_get(wallGrid,i,j) = 1) instance_create_depth(i * blockWidth, j + blockWidth, 0, oTerrainLarge)	
		}
	}
	
	ds_grid_destroy(wallGrid)
	
	
	
}