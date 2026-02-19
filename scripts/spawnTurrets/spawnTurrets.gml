// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnTurrets(turretArray, numTurrets){

	var randIndex = irandom(array_length(turretArray))
	
	var spawnX = 0
	var spawnY = 0
	var spawnDirection = 0
	
	var spawnedTurret = noone

	for (var i = 0; i < numTurrets; i++) {
		
		spawnX = struct_get(array_get(turretArray,i),"gx") * blockWidth
		spawnY = struct_get(array_get(turretArray,i),"gy") * blockWidth
		
		spawnDirection = struct_get(array_get(turretArray,i),"direction")
		
		spawnedTurret = instance_create_depth(spawnX,spawnY,0,oEnemy2)
		
		//PASS THE DIRECTION TO THE TURRET
		switch(spawnDirection)
		{
			case 0:
				spawnedTurret.image_angle = 90
			case 1:
				spawnedTurret.image_angle = 0
			case 2:
				spawnedTurret.image_angle = 270
			case 3:
				spawnedTurret.image_angle = 180
		}
		
		//Delete the value in the array we just spawned and generate a new random index
		array_delete(turretArray,i,1)
		randIndex = irandom(array_length(turretArray))
		
		
	}

}