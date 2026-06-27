/// @description Create child beam if necessary

//The image angle was passed to this via a struct as 'index' - first we set the image_angle to index
image_angle = index

//NEED TO INITIALLY SET MASK TO SOMETHING ELSE FOR ALL OF COLLISION DETECTION

//Start off by assuming we need to create a new lightning strike at the end of this one
var createNew = true

maxLaserIterations = 3 //How many segments do we want to create

//X and Y of the new lightning bolt to be created
newX = x + lengthdir_x(sprite_width,image_angle)
newY = y + lengthdir_y(sprite_width,image_angle)
//Variables to calculate the new sprite x ratio
var iterator = 1
spriteRatio = 1

//This function determines the x scale of the laser - if it hits a wall, the x-scale is smaller
spriteRatio = laserXScale()	

//We won't create a new laser if we're out of bounds or if we already hit a wall/player
if(x > room_width or x < 0) createNew = false
if(y > room_height or y < 0) createNew = false
if(spriteRatio < 1) createNew = false
if(currentIteration > 3) createNew = false

mask_index = sprite_index

var temp = creatingInstance

//If we need to create a new lightning strike, do so
nextStrike = noone
if(createNew) {
	//This passes image_angle in a struct as 'index'
	nextStrike = instance_create_layer(newX, newY, layer, oEnemyLaserChild, { index : image_angle, parentID : id, creatingInstance: temp, currentIteration : currentIteration + 1})	
}