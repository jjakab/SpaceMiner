// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroyTerrainInCircle(passedX,passedY,passedRadius){
	
	//This will destroy all terrain (besides edges) within a specified radius
	
	var tempTerrainList = ds_list_create()

	var num = collision_circle_list(passedX,passedY,passedRadius + 15,oTerrainMaster,false,true,tempTerrainList,false)
	
	//If there is at least one item in list, loop through
	if(num > 0) {
		
		//If any element in the list is not an edge terrain, destroy it
		for (var i = 0; i < num; i++) {
			if(not(ds_list_find_value(tempTerrainList,i).object_index == oTerrainEdge)) {
				instance_destroy(ds_list_find_value(tempTerrainList,i))
			}
		}
	}
	
	ds_list_destroy(tempTerrainList)

}