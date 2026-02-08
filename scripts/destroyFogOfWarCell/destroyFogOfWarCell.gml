// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroyFogOfWarCell(fogIndex){
	
	//If there has been some error and this is undefined, just exit
	if(fogIndex = undefined || not(instance_exists(fogIndex))) exit
	
	if(instance_exists(oPlayerSpaceship)) {
		
		//Measure the angle between the player
		var angleDiff = point_direction(fogIndex.x,fogIndex.y,oPlayerSpaceship.x,oPlayerSpaceship.y)
		var newSpriteIndex = noone
		var newAngle = 0
		
		
		//Straight right
		if(angleDiff <= 22.5 || angleDiff >= 337.5) {
			newSpriteIndex = sFogOfWarDisappearSideExterior
			newAngle = 0
		}
		//Upper right
		else if (angleDiff < 67.5) {
			newSpriteIndex = sFogOfWarDisappearCornerExterior
			newAngle = 0
		}
		//Straight up
		else if (angleDiff < 112.5) {
			newSpriteIndex = sFogOfWarDisappearSideExterior
			newAngle = 90
		}
		//Upper left
		else if (angleDiff < 157.5) {
			newSpriteIndex = sFogOfWarDisappearCornerExterior
			newAngle = 90
		}
		//Straight left
		else if (angleDiff < 202.5) {
			newSpriteIndex = sFogOfWarDisappearSideExterior
			newAngle = 180
		}
		//Bottom left
		else if (angleDiff < 247.5) {
			newSpriteIndex = sFogOfWarDisappearCornerExterior
			newAngle = 180
		}
		//Straight down
		else if (angleDiff < 292.5) {
			newSpriteIndex = sFogOfWarDisappearSideExterior
			newAngle = 270
		}
		//Bottom right
		else if (angleDiff < 337.5) {
			newSpriteIndex = sFogOfWarDisappearCornerExterior
			newAngle = 270
		}
		
		
		//None of the angle checks worked - just destroy the fog cell
		else {
			instance_destroy(fogIndex)
		}
		
		//Set image angle and sprite index based on the angle
		with(fogIndex) {
			
			//Set sprite index of exterior and interior
			sprite_index = newSpriteIndex
			if(sprite_index = sFogOfWarDisappearSideExterior) pairedInterior.sprite_index = sFogOfWarDisappearSideInterior
			else if (sprite_index = sFogOfWarDisappearCornerExterior) pairedInterior.sprite_index = sFogOfWarDisappearCornerInterior
			
			//Set image angle
			image_angle = newAngle
			pairedInterior.image_angle = newAngle
		
		}
		
		exit
		
	}
	
	//No player exists - we just destroy the fog cell
	else {
		instance_destroy(fogIndex)
	}

	
	
}