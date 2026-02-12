function spawnFogOfWar(){
	
	//Declare the offset that we use when placing the fog of war items (as they're centered middle middle)
	var xOffset = fogWidth / 2
	var yOffset = fogWidth / 2
	
	//Iterate through ds grid positions and create fog of war objects
	for (var i = 0; i < ds_grid_width(fogGrid); i++) {
		for (var j = 0; j < ds_grid_height(fogGrid); j++) {
			
			
			var fog = instance_create_depth((i * fogWidth) + xOffset, (j * fogWidth) + yOffset,-5,oFogOfWarExterior)
			ds_grid_set(fogGrid,i,j,fog)
			
			
		}
	}
	
	
}