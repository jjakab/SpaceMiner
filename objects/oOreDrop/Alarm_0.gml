/// @description Shake and reset timer

//If ore is in idle state, wiggle up/down
if(oreState = "idle") {
	y = y + shakeDir
	shakeDir = shakeDir * -1

	alarm_set(0,shakeTimer)
}
