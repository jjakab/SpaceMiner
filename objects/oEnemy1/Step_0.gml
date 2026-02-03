/// @description Act depending on state
switch(playerState) {
	
	//If we are in idle state, we change to seeking state if player is within a certain distance
	case state.idle:
	
		break;
	
	//If we are in seeking player state, we try to seek the player while avoiding walls
	case state.seekingPlayer:
	
		//Make sure the player exists
		if(instance_exists(oPlayerSpaceship)) {
			
			//If we are in range of player, start shooting
			if(point_distance(x,y,oPlayerSpaceship.x,oPlayerSpaceship.y) < rangeToShoot) {
				playerState = state.shootingLaser		
			}
			
			//if we are not in range of player, take a step towards the player and rotate
			else {
				mp_potential_step(oPlayerSpaceship.x,oPlayerSpaceship.y,moveSpeed,false)
				rotateTowardsPlayer(maxTurnSpeedMoving)
			}
			
		}

		break;
		
	case state.shootingLaser:
	
		rotateTowardsPlayer(maxTurnSpeedShooting)
	
		break;
	
	
	
	
	
}
