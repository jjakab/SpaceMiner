/// @description Destroy the DS list and attached turret

//Destroy any turret mounted to this overall terrain block
if (variable_instance_exists(id, "attachedTurret") && instance_exists(attachedTurret))
{
	instance_destroy(attachedTurret)
}

ds_list_destroy(minilist)
