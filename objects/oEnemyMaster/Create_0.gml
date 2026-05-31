/// @description Initialize variables

//Default enemy damage values
damageable = true
hp = 10

//Variables related to proximity arrow
showsProxArrow = true

viewportWidth = view_get_wport(view_camera[0])
viewportHeight = view_get_hport(view_camera[0])
cameraWidth = camera_get_view_width(view_camera[0])
cameraHeight = camera_get_view_height(view_camera[0])
wScale = viewportWidth / cameraWidth
hScale = viewportHeight / cameraHeight
guiHeight = 0 //Need to replace this with real value

arrowSprite = sProximityArrows
numFrames = sprite_get_number(arrowSprite)

minProxDistance = 10
maxProxDistance = 240
proxInterval = (maxProxDistance - minProxDistance) / numFrames

borderDistance = 20 //How far from screen borders do prox arrows show

