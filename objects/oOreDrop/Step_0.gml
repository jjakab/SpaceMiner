/// @description Magnetize if player in distance, and move towards player if magnetized

//If idle, we become magnetized if player is withind istance
if(oreState = "idle") {
	//Make sure delay timer has elapsed
	if(alarm_get(1) <= 0) {
		//Check if player spaceship is in range then magnetize
		if(instance_exists(oPlayerSpaceship)) {
			if(distance_to_object(oPlayerSpaceship) < distanceToMagnetize) {
				oreState = "magnetized"	
			}
		}
	}
}

//If already magnetized, move towards player and increment speed
else {
	if(instance_exists(oPlayerSpaceship)) {
		//Check if we're already at destination
		if(point_distance(x,y,oPlayerSpaceship.x,oPlayerSpaceship.y) < (2 * magnetizeSpeed)) {
			
			with(oPlayerSpaceship) fuelFragmentReceived()
			//REPLENISH PLAYER FUEL
			instance_destroy()
			
		}
		else {
			var angleToPlayer = point_direction(x,y,oPlayerSpaceship.x,oPlayerSpaceship.y)
			x += lengthdir_x(magnetizeSpeed,angleToPlayer)
			y += lengthdir_y(magnetizeSpeed,angleToPlayer)
			magnetizeSpeed += magnetizeSpeedIncrement
		}
	}
}
