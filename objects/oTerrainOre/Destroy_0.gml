/// @description Screenshake and create ore fragments
screenshake(5,2,.1)

//Create four ore fragments

var sw = sprite_get_width(sprite_index)
var sh = sprite_get_height(sprite_index)

var varMin = -2
var varMax = 0

	//Top left
	instance_create_depth(x + (sw / 4) + irandom_range(varMin,varMax),y + (sw / 4) + irandom_range(varMin,varMax),depth,oOreDrop)
	
	//Top right
	instance_create_depth(x + (3 * sw / 4) + irandom_range(varMin,varMax),y + (sw / 4) + irandom_range(varMin,varMax),depth,oOreDrop)
	
	//Bottom left
	instance_create_depth(x + (sw / 4) + irandom_range(varMin,varMax),y + (3 * sw / 4) + irandom_range(varMin,varMax),depth,oOreDrop)
	
	//Bottom right
	instance_create_depth(x + (3 * sw / 4) + irandom_range(varMin,varMax),y + (3 * sw / 4) + irandom_range(varMin,varMax),depth,oOreDrop)