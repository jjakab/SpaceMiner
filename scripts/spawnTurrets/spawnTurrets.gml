// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnTurrets(turretArray, numTurrets){
	
	//Cap the number of turrets possibly generated at the array length
	numTurrets = min(numTurrets,array_length(turretArray))

	var randIndex = irandom(array_length(turretArray))
	
	var spawnX = 0
	var spawnY = 0
	var spawnDirection = 0
	
	var spawnedTurret = noone

	for (var i = 0; i < numTurrets; i++) {
		
		//Make sure we aren't out of bounds - if we are stop spawning turrets
		if(i >= array_length(turretArray)) break;
		
		spawnX = struct_get(array_get(turretArray,i),"gx") * blockWidth
		spawnY = struct_get(array_get(turretArray,i),"gy") * blockWidth
		
		spawnDirection = struct_get(array_get(turretArray,i),"dir")
		
		spawnedTurret = instance_create_depth(spawnX,spawnY,0,oEnemyTurret)
		
		//Change turret position and image angle based on direction
		switch(spawnDirection)
		{
			case 0:
				spawnedTurret.image_angle = 90
				spawnedTurret.baseAngle = 90;
				spawnedTurret.x += blockWidth / 2
			break;
			
			case 1:
				spawnedTurret.image_angle = 0
				spawnedTurret.baseAngle = 0;
				spawnedTurret.x += blockWidth
				spawnedTurret.y += blockWidth / 2
			break;
			case 2:
				spawnedTurret.image_angle = 270
				spawnedTurret.baseAngle = 270;
				spawnedTurret.x += blockWidth / 2
				spawnedTurret.y += blockWidth
			break;
			case 3:
				spawnedTurret.image_angle = 180
				spawnedTurret.baseAngle = 180;
				spawnedTurret.y += blockWidth / 2
			break;
		}
		
		//Delete the value in the array we just spawned and generate a new random index
		array_delete(turretArray,i,1)
		randIndex = irandom(array_length(turretArray))
		
		
	}

}