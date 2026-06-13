/* This is called by the player object and will create the effect of the player disappearing
 as well as deciding what room to teleport to
*/
function startRoomTransition(){
	
	//Increment room counter by 1
	global.playerCurrentRoom++
	
	//Choose the next room
	var nextRoom = chooseNextRoom(room)
	
	//Create the disappear object and pass the room to it
	var disappearObj = instance_create_layer(x,y,"Blackhole",oPlayerDisappearEffect)
	with(disappearObj) {
		tpRoom = nextRoom
	}
	
	//Destroy the player
	instance_destroy()
	
}