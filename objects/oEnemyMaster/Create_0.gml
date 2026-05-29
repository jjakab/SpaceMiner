/// @description Initialize variables

//Variables related to proximity arrow
showsProxArrow = true

viewportWidth = view_get_wport(view_camera[0])
viewportHeight = view_get_hport(view_camera[0])
cameraWidth = camera_get_view_width(view_camera[0])
cameraHeight = camera_get_view_height(view_camera[0])
guiHeight = 0 //Need to replace this

arrowSprite = sProxArrowTest
numFrames = sprite_get_number(arrowSprite)

minProxDistance = 10
maxProxDistance = 240
proxInterval = (maxProxDistance - minProxDistance) / numFrames

