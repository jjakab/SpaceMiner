function spawnExtractionEnemies(extractionX, extractionY, waveIndex, extractionRadius = 160, dronesPerWave = 2){
	
	var enemyConfig = [
		{
			objectType: oHunterDrone,
			count: dronesPerWave,
			minRadius: extractionRadius + 32,
			maxRadius: extractionRadius + 112
		}
	]
	
	for (var configIndex = 0; configIndex < array_length(enemyConfig); configIndex++) {
		var config = enemyConfig[configIndex]
		
		for (var i = 0; i < config.count; i++) {
			var spawnedEnemy = noone
			
			for (var attempt = 0; attempt < 16; attempt++) {
				var spawnAngle = irandom(359)
				var spawnRadius = irandom_range(config.minRadius, config.maxRadius)
				var spawnX = extractionX + lengthdir_x(spawnRadius, spawnAngle)
				var spawnY = extractionY + lengthdir_y(spawnRadius, spawnAngle)
				
				if (spawnX < 16 || spawnX > room_width - 16 || spawnY < 16 || spawnY > room_height - 16) {
					continue
				}
				
				if (collision_circle(spawnX, spawnY, 8, oTerrainMaster, false, true)) {
					continue
				}
				
				spawnedEnemy = instance_create_layer(spawnX, spawnY, "Ships", config.objectType)
				break
			}
			
			if (spawnedEnemy != noone && spawnedEnemy.object_index == oHunterDrone) {
				spawnedEnemy.currentState = DroneState.STRAFE
				spawnedEnemy.patrolAnchor = noone
				spawnedEnemy.patrolRadius = extractionRadius
				spawnedEnemy.strafeRetargetTimer = spawnedEnemy.strafeRetargetDuration
				spawnedEnemy.strafeDirection = choose(-1, 1)
			}
		}
	}
}
