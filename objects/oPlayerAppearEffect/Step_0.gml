/// @description Spawn player
if(image_index = 5 and hasSpawnedPlayer = false) {
	instance_create_depth(x,y,depth,oPlayerSpaceship)
	hasSpawnedPlayer = true	
}
