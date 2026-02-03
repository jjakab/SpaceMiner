// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function deleteLargeTerrain(){

	//Start off by assuming this large terrain block has no miniterrains associated with it
	var hasMinis = false;
	
	//Loop through every item in the data structure
	for (var i = 0; i < ds_list_size(minilist); i++) {
		
		//If any item is exists (i.e. a miniframe exists), set var to true and break out of loop
		if(instance_exists(ds_list_find_value(minilist,i))) {
			hasMinis = true;
			break;
		}
	}
	
	//If entire loop went through and no minis were found, destroy the large grid as it's no longer needed
	if(!hasMinis) {
		instance_destroy()
	}

}