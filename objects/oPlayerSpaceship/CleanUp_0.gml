/// @description Destroy particle systems, store global variables

for (var i = 0; i < numLasers; i++) {
	part_system_destroy(laserPartSystem[i])
}

part_system_destroy(trailPartSystem)

global.playerCurrentFuel = currentFuel