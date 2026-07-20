// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnPlayer(){
	
	//This function will spawn the player in a random quadrant different than the blackhole
	
	//If this is the shop, we don't need to spawn the player randomly, so exit
	if(room = rShop) {
		exit;	
	}
	
	var spawnBuffer = 20 //How far at minimum from the edge of the quadrant do we want the player to spawn
	
	var blackholeQuadrant = 0
	var playerQuadrant = 0

	//Find out which quadrant of the map the blackhole is in
	if(instance_number(oBlackhole) > 0) {
		
		//Check if this is one of the left two quadrants
		if(oBlackhole.x < (room_width / 2)) {
			if(oBlackhole.y > (room_height / 2)) {
				blackholeQuadrant = 3
			}
			else {
				blackholeQuadrant = 1	
			}
		}
		else {
			if(oBlackhole.y > (room_height / 2)) {
				blackholeQuadrant = 4
			}
			else {
				blackholeQuadrant = 2	
			}	
		}
	}
	
	//Choose a player quadrant different than the blackhole quadrant
	do {
		playerQuadrant = choose(1,2,3,4)
	} until blackholeQuadrant != playerQuadrant
	
	var spawnX = 0
	var spawnY = 0
	
	//Choose a random location in quadrant 1
	spawnX = irandom_range(spawnBuffer,(room_width / 2) - spawnBuffer)
	spawnY = irandom_range(spawnBuffer,(room_height / 2) - spawnBuffer)
	
	//Modify location so it is in correct quadrant
	if(playerQuadrant = 2 or playerQuadrant = 4) spawnX += (room_width / 2)
	if(playerQuadrant = 3 or playerQuadrant = 4) spawnY += (room_height / 2)
	
	instance_create_layer(spawnX,spawnY,"Blackhole",oPlayerAppearEffect)

}