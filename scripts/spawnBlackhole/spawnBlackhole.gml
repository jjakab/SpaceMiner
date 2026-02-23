// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnBlackhole(){
	
	//Called by oController
	//Creates a blackhole within bounds
	
	var buffer = 32
	var sw = sprite_get_width(sBlackhole)
	
	var rx = irandom_range(buffer + sw, room_width - buffer - sw)
	var ry = irandom_range(buffer + sw, room_height - buffer - sw)
	
	instance_create_depth(rx,ry,0,oBlackhole)


}