// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnBlackhole(){
	
	var buffer = 32
	var sw = sprite_get_width(sBlackhole)
	
	var rx = irandom_range(buffer + sw, room_width - buffer - sw)
	var rx = irandom_range(buffer + sw, room_height - buffer - sw)
	
	
}