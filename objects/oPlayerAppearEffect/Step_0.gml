/// @description Spawn player
if(image_index = spawnFrame and hasSpawnedPlayer = false) {
	instance_create_layer(x,y,"Player",oPlayerSpaceship)
	hasSpawnedPlayer = true	
}
