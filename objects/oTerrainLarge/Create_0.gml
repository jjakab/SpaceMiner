/// @description Create smaller blocks

//We want this object to have no hitbox
mask_index = sGenericBigOutlineMask

//Create a DS list with all miniframes that are part of this larger block
minilist = ds_list_create()

//Start at -1,-1 relative to origin and place terrain minis

//Get this width/height
var thisWidth = sprite_get_width(sprite_index)

//Get the width/height of the mini sprite
var cellWidth = sprite_get_width(sGenericOutline)

//How many cells should be added per row
var cellsPerRow = round(thisWidth/cellWidth) * 2 + 1

var xPos = 0
var yPos = 0

//Loop through each location relative to origin and place mini blocks - we do it in reserve for more efficient array usage
for (var i = 0; i < cellsPerRow; i++) {
	for (var j = 0; j < cellsPerRow; j++) {
		
		xPos = i * (cellWidth / 2 - 1) - 1
		yPos = j * (cellWidth / 2 - 1) - 1
		
		miniblock = instance_create_depth(x + xPos,y + yPos,0,oTerrainMiniFrame)
		//miniblockArray[cellsPerRow - i,cellsPerRow - j] = miniblock
		
		with(miniblock) {
			parentFrame = other
		}
		
		ds_list_add(minilist,miniblock)
		
	}
}
