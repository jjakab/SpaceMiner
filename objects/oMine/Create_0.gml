/// @description Initialize

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
