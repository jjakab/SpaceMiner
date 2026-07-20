/// @description Destroy the DS list and attached turret

//Destroy any turret mounted to this overall terrain block
if (variable_instance_exists(id, "attachedTurret") && instance_exists(attachedTurret))
{
	instance_destroy(attachedTurret)
}


//If the ds list has been created, destroy every item in the list, then the list itself
if(variable_instance_exists(id,"minilist")) {
	
	//Destroy all elements of miniterrain in the DS list
	for (i = 0; i < ds_list_size(minilist); i++) {
		if(instance_exists(ds_list_find_value(minilist,i))) {
			instance_destroy(ds_list_find_value(minilist,i))
		}
	}

	//Destroy the list itself
	ds_list_destroy(minilist)
}
