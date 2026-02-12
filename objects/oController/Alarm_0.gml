/// @description Activation/Deactivation

//Deactivate all terrain objects (except edges)
instance_deactivate_object(oTerrainMiniFill)
instance_deactivate_object(oTerrainMiniFrame)
instance_deactivate_object(oTerrainLarge)

//Set variables for camera bounds
var vx = camera_get_view_x(view_camera[0])
var vy = camera_get_view_y(view_camera[0])
var vw = camera_get_view_width(view_camera[0])
var vh = camera_get_view_height(view_camera[0])

//Declare a variable for buffer around current camera view we want to activate
var buffer = 50

instance_activate_region(vx - buffer, vy - buffer, vx + vw + buffer, vy + vh + buffer,true)

alarm_set(0,activationInterval)
