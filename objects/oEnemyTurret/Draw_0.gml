/// @description Draw turret and barrel

//Center the barrel pivot inside the base semicircle
var barrelX = x + lengthdir_x(barrelPivotOffset, image_angle)
var barrelY = y + lengthdir_y(barrelPivotOffset, image_angle)

draw_sprite_ext(sTurretBarrel,0,barrelX,barrelY,1,1,barrelAngle,c_white,1)
draw_sprite_ext(sTurretBase,0,x,y,1,1,image_angle,c_white,1)
