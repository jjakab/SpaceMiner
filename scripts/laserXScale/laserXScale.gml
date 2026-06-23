// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function laserXScale(){
	
	//Iterate over pixels in laser beam range, stop upon reaching max range or an object
	for(i = 0; i < sprite_get_width(sTurretLaserBeam); i++){

	    lx = lengthdir_x(i, image_angle);
	    ly = lengthdir_y(i, image_angle);

		//Check if we hit an object
	    if(collision_point(lx, ly, oTerrainMaster, false, true)){
			
			//We have hit a large terrain object, and should check its list of miniterrains
			if(instance_position(lx,ly,oTerrainLarge)) {
				
				//Find the specific instance
				var largeGrid = instance_position(lx,ly,oTerrainLarge)
				
				//Make sure the instance has spawned miniterrains - if it's despawned it may not
				if(largeGrid.hasSpawnedChildren) {
				
					//Construct a list of the mini-terrains
					var listLength = ds_list_size(largeGrid.minilist)
				
					//Loop through each mini-terrain
					for (var j = 0; j < listLength; j++) {
					
						//If a mini-terrain is hit, return that ratio
						if(instance_position(lx,ly,ds_list_find_value(largeGrid.minilist,j))) {
								return i / sprite_get_width(sTurretLaserBeam)
						}
					}
				}
				
			}
			
			//If this was not a large terrain, return the sprite ratio
			else {
				return i / sprite_get_width(sTurretLaserBeam)
			}

		}

	}
	
	//If we go through entire i loop without hitting anything, return 1
	return 1

}