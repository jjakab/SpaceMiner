/// @description Initialize
image_speed = 0
image_index = irandom(image_number - 1)

oreState = "idle"

distanceToMagnetize = 32

magnetizeSpeed = 1
magnetizeSpeedIncrement = .02

shakeTimer = 45
shakeDir = 1

alarm_set(0,shakeTimer + irandom_range(-15,15))

//How long should we prevent these from magnetizing
initialDelay = 30
alarm_set(1,initialDelay)

