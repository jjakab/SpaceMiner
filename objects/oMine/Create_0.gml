/// @description Initialize
event_inherited()
damageable = true
hp = 10
//Offset to center of cell
x+= 8
y+= 8

//Randomize starting angle
image_angle = irandom(360)

//Set angle increment speed, then randomize direction
angleIncrement = 0.5

var rand = irandom(1)
if(rand = 0) rand = -1

angleIncrement = angleIncrement * rand

enum MineState {
    IDLE,
    TRIGGERED
}

currentState = MineState.IDLE;

damage = 25;
triggerRadius = 40;

//Seconds before explosion
explodeTimer = 1;