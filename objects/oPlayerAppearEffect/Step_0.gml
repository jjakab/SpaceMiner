/// @description Spawn player
if(image_index = spawnFrame and hasSpawnedPlayer = false) {
	instance_create_depth(x,y,depth-1,oPlayerSpaceship)
	hasSpawnedPlayer = true	
}
