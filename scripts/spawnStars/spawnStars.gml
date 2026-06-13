// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnStars(){
	
	
	//What square area do we want 1 star in on average?
	var starDensityWidth = 30
	var starDensityHeight = 30
	
	var numCellsX = ceil(room_width / starDensityWidth)
	var numCellsY = ceil(room_height / starDensityHeight)
	
	//Spawn stars based on width and height
	for (var i = 0; i < numCellsX; i++) {
		for (var j = 0; j < numCellsY; j++) {
			instance_create_layer((i * starDensityWidth) + round(random(starDensityWidth)),(j * starDensityHeight) + round(random(starDensityHeight)),"Stars",oStar)
		}
	}

}