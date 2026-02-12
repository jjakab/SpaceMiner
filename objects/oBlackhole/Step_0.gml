/// @description Insert description here


//Determine if this is visible for the first time, and shake the screen if so
var isVisibleBool = isVisible(0,0)

if(isVisibleBool and (hasShakenScreen = false)) {
	screenshake(150,3,.1)
	hasShakenScreen = true
}
