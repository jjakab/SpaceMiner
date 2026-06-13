/// @description Destroy data structures

if(variable_instance_exists(id,"fogGrid")) ds_grid_destroy(fogGrid)
if(variable_instance_exists(id,"wallGrid")) ds_grid_destroy(wallGrid)
if(variable_instance_exists(id,"foregroundColors")) ds_list_destroy(foregroundColors)
if(variable_instance_exists(id,"backgroundColors")) ds_list_destroy(backgroundColors)