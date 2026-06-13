/// @description Screenshake and create ore fragments
screenshake(5,2,.1)

//Destroy any turret mounted to this terrain block
if (variable_instance_exists(id, "attachedTurret") && instance_exists(attachedTurret))
{
	instance_destroy(attachedTurret)
}

//Create four ore fragments

var sw = sprite_get_width(sprite_index)
var sh = sprite_get_height(sprite_index)

var varMin = -2
var varMax = 0

	//Top left
	instance_create_layer(x + (sw / 4) + irandom_range(varMin,varMax),y + (sw / 4) + irandom_range(varMin,varMax),"Ore",oOreDrop)
	
	//Top right
	instance_create_layer(x + (3 * sw / 4) + irandom_range(varMin,varMax),y + (sw / 4) + irandom_range(varMin,varMax),"Ore",oOreDrop)
	
	//Bottom left
	instance_create_layer(x + (sw / 4) + irandom_range(varMin,varMax),y + (3 * sw / 4) + irandom_range(varMin,varMax),"Ore",oOreDrop)
	
	//Bottom right
	instance_create_layer(x + (3 * sw / 4) + irandom_range(varMin,varMax),y + (3 * sw / 4) + irandom_range(varMin,varMax),"Ore",oOreDrop)
