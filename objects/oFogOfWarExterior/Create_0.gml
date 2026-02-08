/// @description Create a paired interior
pairedInterior = instance_create_depth(x,y,depth-1,oFogOfWarInterior)
with(pairedInterior) {
	image_speed = other.image_speed	
}

//Track how this is visually being destroyed
destroySide = false
destroyCorner = false

