// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroyFogOfWarGrid(xGridPos, yGridPos){

	var variance = 2
	
	var maxHeight = ds_grid_height(fogGrid)
	var maxWidth = ds_grid_width(fogGrid)

	//Loop through each position surrounding our specified position
	for (var xVar = -variance; xVar <= variance; xVar++) {
		for (var yVar = -variance; yVar <= variance; yVar++) {
			
			//Find and destroy the fog cell, but not beyond the grid borders
			var fogCell = ds_grid_get(fogGrid,clamp(xGridPos+xVar,0,maxWidth),clamp(yGridPos+yVar,0,maxHeight))
			destroyFogOfWarCell(fogCell)
		}
	}


}