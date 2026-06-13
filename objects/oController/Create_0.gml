/// @description Destroy if duplicated

//If this somehow got duplicated, destroy it
if(instance_number(oController) > 1) instance_destroy(id,false)