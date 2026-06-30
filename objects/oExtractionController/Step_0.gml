/// @description Run extraction timer, pressure waves, and completion

if (!instance_exists(player)) {
	instance_destroy()
	exit
}

if (!instance_exists(blackhole)) {
	if (instance_exists(oBlackhole)) {
		blackhole = oBlackhole
	}
	else {
		instance_destroy()
		exit
	}
}

var dt = delta_time / 1000000
var distToBlackhole = point_distance(player.x, player.y, blackhole.x, blackhole.y)
isPlayerInRange = distToBlackhole <= radius

if (isPlayerInRange) {
	remainingTime = max(0, remainingTime - dt)
}
else {
	var fuelDrain = fuelDrainPerSecondOutside * dt
	with (player) {
		adjustFuel(-fuelDrain, "extraction_range")
	}
}

shakeTimer -= dt
if (shakeTimer <= 0) {
	screenshake(6, .45, .1)
	shakeTimer = shakeIntervalSeconds
}

spawnTimer -= dt
if (spawnTimer <= 0) {
	spawnExtractionEnemies(blackhole.x, blackhole.y, waveIndex, radius, dronesPerWave)
	waveIndex += 1
	spawnTimer = spawnIntervalSeconds
}

if (!isComplete && remainingTime <= 0) {
	isComplete = true
	with (player) {
		hasHitBlackhole = true
		gravity = 0
	}
	instance_destroy()
}
