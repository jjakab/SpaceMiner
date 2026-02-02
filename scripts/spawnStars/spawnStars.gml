// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnStars(){

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


}