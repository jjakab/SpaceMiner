//Set damageable and starting hp
damageable = true
hp = 40
maxHp = hp

onDeath = function(damageContext) {
	if (variable_instance_exists(id, "didDeathEffects") && didDeathEffects) {
		return
	}
	didDeathEffects = true
	
	screenshake(5,2,.1)

	//Destroy any turret mounted to this terrain block
	if (variable_instance_exists(id, "attachedTurret") && instance_exists(attachedTurret))
	{
		instance_destroy(attachedTurret)
	}

	//Create four ore fragments
	var sw = sprite_get_width(sprite_index)
	var varMin = -2
	var varMax = 0

	instance_create_layer(x + (sw / 4) + irandom_range(varMin,varMax),y + (sw / 4) + irandom_range(varMin,varMax),"Ore",oOreDrop)
	instance_create_layer(x + (3 * sw / 4) + irandom_range(varMin,varMax),y + (sw / 4) + irandom_range(varMin,varMax),"Ore",oOreDrop)
	instance_create_layer(x + (sw / 4) + irandom_range(varMin,varMax),y + (3 * sw / 4) + irandom_range(varMin,varMax),"Ore",oOreDrop)
	instance_create_layer(x + (3 * sw / 4) + irandom_range(varMin,varMax),y + (3 * sw / 4) + irandom_range(varMin,varMax),"Ore",oOreDrop)
}
