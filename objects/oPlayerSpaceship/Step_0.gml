/// @description Movement, etc.

//Get info about joysticks from GUI object - i have zero clue why it has to be negative
leftAngle = -1 * oGUI.joystickOneAngle
leftFactor = oGUI.joystickOneFactor

rightAngle = -1 * oGUI.joystickTwoAngle
rightFactor = oGUI.joystickTwoFactor

//Change the player angle if the right joystick is being used, then shoot a laser
if(rightFactor > 0) {
	
	var angleDiff = angle_difference(image_angle,rightAngle)
	if(abs(angleDiff) > maxSpinSpeed) image_angle -= sign(angleDiff) * maxSpinSpeed else image_angle = rightAngle
	
}
else {
	for (var i = 0; i < numLasers; i++) {
		currLaserLength[i] = max(0,currLaserLength[i] - laserIncrementRate[i])
	}
}

//If the left joystick is being used, adjust the player's speed
if(leftFactor > 0) {
	//First check that the player has fuel
	if(currentFuel > 0) {
		
		//Speed up
		xSpeed += accelerationSpeed * lengthdir_x(leftFactor,leftAngle)
		ySpeed += accelerationSpeed * lengthdir_y(leftFactor,leftAngle)
		
		//Burn fuel
		currentFuel = max(0,currentFuel - (leftFactor * fuelBurnRate))
		
		//Increment particle timer
		trailPartTimer += leftFactor
	}
}

//Regardless of whether the left joystick is being used, we slow the player
xSpeed = xSpeed * slowFactor
ySpeed = ySpeed * slowFactor

//Start by assuming we're not colliding with anything
var isColliding = false

//Check for collision in x-direction with terrain-master
if(place_meeting(x+xSpeed,y,oTerrainMaster)) {
	
	//If the collision is with an edge, set the flag and reverse direction
	if(place_meeting(x+xSpeed,y,oTerrainSingleBlock)) {
		isColliding = true
		xSpeed = -xSpeed * bounceCoefficient
	}
	
	//If the collision is with a large terrain, check if we're actually colliding by comparing against the minilist
	else if(place_meeting(x + xSpeed, y, oTerrainLarge)) {
		
		//Create vars for terrain object
		var largeTerrain = instance_place(x + xSpeed, y, oTerrainLarge)
		
		//Make sure this terrain has spawned children
		if(largeTerrain.hasSpawnedChildren) {
		
			//Create a var for list size
			var listSize = ds_list_size(largeTerrain.minilist)
		
			//Loop through each miniterrain in list
			for (var j = 0; j < listSize; j++) {
			
				//Check if this object exists
				if(instance_exists(ds_list_find_value(largeTerrain.minilist,j))) {
				
					//If it exists, check if we're colliding with it
					if(place_meeting(x + xSpeed, y, ds_list_find_value(largeTerrain.minilist,j))) {
					
						//If we're colliding with it, flag and switch direction, then break
						isColliding = true
						xSpeed = -xSpeed * bounceCoefficient
	 					break;
					}
				}
			}
		}
	}
	
}

//Reset isColliding
isColliding = false

//Repeat in y-direction
if(place_meeting(x,y+ySpeed,oTerrainMaster)) {
	
	//If the collision is with an edge, set the flag and reverse direction
	if(place_meeting(x,y+ySpeed,oTerrainSingleBlock)) {
		isColliding = true
		ySpeed = -ySpeed * bounceCoefficient
	}
	
	//If the collision is with a large terrain, check if we're actually colliding by comparing against the minilist
	else if(place_meeting(x, y + ySpeed, oTerrainLarge)) {
		
		//Create vars for terrain object
		var largeTerrain = instance_place(x, y + ySpeed, oTerrainLarge)
		
		//Make sure this terrain has spawned children
		if(largeTerrain.hasSpawnedChildren) {
			
			//Create var for list size
			var listSize = ds_list_size(largeTerrain.minilist)
		
			//Loop through each miniterrain in list
			for (var j = 0; j < listSize; j++) {
			
				//Check if this object exists
				if(instance_exists(ds_list_find_value(largeTerrain.minilist,j))) {
				
					//If it exists, check if we're colliding with it
					if(place_meeting(x, y + ySpeed, ds_list_find_value(largeTerrain.minilist,j))) {
					
						//If we're colliding with it, flag and switch direction, then break
						isColliding = true
						ySpeed = -ySpeed * bounceCoefficient
						break;
					}
				}
			}
		}
	}
}

//Check for blackhole collision
if(place_meeting(x,y,oBlackhole)) {
	hasHitBlackhole = true
}

//If player has hit black hole, increment gravity and decrement image scale
if(hasHitBlackhole) {
	
	//Set scale to ratio of distance to blackhole center
	currentScale = min(1,point_distance(x,y,oBlackhole.x,oBlackhole.y)/(sprite_get_width(sBlackholeCollisionMask) / 2))
	image_xscale = currentScale
	image_yscale = currentScale
	
	gravity += gravIncrement
	gravity_direction = point_direction(x,y,oBlackhole.x,oBlackhole.y)
	
	//If current scale is zero, teleport to next level
	if(currentScale <= 0.2) {
		startRoomTransition()
		instance_create_depth(x,y,depth,oPlayerDisappearEffect)
		instance_destroy()
	}
}


//If timer has elapsed, emit burst and reset timer
if(trailPartTimer >= trailPartFrequency) {
	part_particles_burst(trailPartSystem,x,y,psPlayerSpaceship)
	trailPartTimer = 0	
}

//Move the player based on xSpeed/ySpeed
x += xSpeed
y += ySpeed

//Round player's position to nearest clean pixel
/*x = round(trueX)
y = round(trueY)
*/