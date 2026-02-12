/// @description Manipulate fog of war

//Update fog of war
if(instance_exists(oPlayerSpaceship)) {
	
	//Re-calculate player position within grid
	var newXGridPos = floor(oPlayerSpaceship.x / fogWidth)
	var newYGridPos = floor(oPlayerSpaceship.y / fogWidth)
	
	//Check if this position is different from the position last frame
	if((newXGridPos != playerGridPositionX) || (newYGridPos != playerGridPositionY)) {
	
		//Position has changed - destroy fog of war
		destroyFogOfWarGrid(newXGridPos,newYGridPos)
		
		//Update the player's location
		playerGridPositionX = newXGridPos
		playerGridPositionY = newYGridPos
	
	}
	
}