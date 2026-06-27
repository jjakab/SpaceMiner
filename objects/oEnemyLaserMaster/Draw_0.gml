/// @description Draw relevant portion

//We only draw the portion from spriteRatio in case we hit an object
var sprite = sTurretLaserBeam
draw_sprite_general(sprite,image_index,0,0,sprite_get_width(sprite) * spriteRatio,sprite_get_height(sprite),x,y,1,1,image_angle,c_white,c_white,c_white,c_white,1)