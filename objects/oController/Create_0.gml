/// @description Initialize variables, spawn objects

//DEBUG OVERLAY FOR TESTING
show_debug_overlay(false)

randomize()

//Spawn edge walls
spawnEdges()

//Spawn stars
spawnStars()

//spawnBlackhole()

	
//Denote width/height of grid
blockWidth = 16
gridWidth = ceil(room_width / blockWidth)
gridHeight = ceil(room_height / blockWidth)
	
//Create grid
wallGrid = ds_grid_create(gridWidth,gridHeight)

//Spawn terrain
spawnTerrainHalls()

//Get list of turret locations
var turretPositions = generateTurretLocations()

//Spawn a specified number of turrets based on list
spawnTurrets(turretPositions,25)

show_debug_message(turretPositions)

//Spawn fog of war - 2d array is declared outside of script
fogWidth = 32
var fogGridWidth = ceil(room_width / fogWidth)
var fogGridHeight = ceil(room_height / fogWidth)

fogGrid = ds_grid_create(fogGridWidth,fogGridHeight)

spawnFogOfWar()

//Determine player position in fog grid
if(instance_exists(oPlayerSpaceship)) {
	playerGridPositionX = floor(oPlayerSpaceship.x / fogWidth)
	playerGridPositionY = floor(oPlayerSpaceship.y / fogWidth)
	
	//Start off 
	destroyFogOfWarGrid(playerGridPositionX,playerGridPositionY)
	
}
else { //Failsafe
	playerGridPositionX = 0
	playerGridPositionY = 0
}

//Activation/Deactivation
activationInterval = 5 //How many frames do we allow to pass before activating/deactivating instances

//Set the initial timer
alarm_set(0,activationInterval)
