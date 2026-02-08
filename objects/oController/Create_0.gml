/// @description Initialize variables, spawn objects

randomize()

//Spawn edge walls
spawnEdges()

//Spawn stars
spawnStars()

//Spawn terrain
spawnTerrain()

//Spawn fog of war - 2d array is declared outside of script
fogWidth = 64
var gridWidth = ceil(room_width / fogWidth)
var gridHeight = ceil(room_height / fogWidth)

fogGrid = ds_grid_create(gridWidth,gridHeight)

spawnFogOfWar()

//Determine player position in fog grid
if(instance_exists(oPlayerSpaceship)) {
	playerGridPositionX = floor(oPlayerSpaceship.x / fogWidth)
	playerGridPositionY = floor(oPlayerSpaceship.y / fogWidth)
	
}
else { //Failsafe
	playerGridPositionX = 0
	playerGridPositionY = 0
}
