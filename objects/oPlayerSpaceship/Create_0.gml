/// @description Initialize variables

//Variables related to joysticks
leftAngle = 0
leftFactor = 0

rightAngle = 0
rightFactor = 0

//Variables related to movement
maxSpinSpeed = 3
xSpeed = 0
ySpeed = 0
accelerationSpeed = .0003
slowFactor = 0.99
bounceCoefficient = 0.6

	//These avoid sub-pixel movement
	trueX = x
	trueY = y

//Variables related to fuel
maxFuel = 100
currentFuel = maxFuel
fuelBurnRate = 0.0005


//Variables related to laser - stored for each laser separately
numLasers = 2
for (var i = 0; i <= 1; i++) {
	laserLengthCap[i] = 100
	currLaserLength[i] = 0
	laserIncrementRate[i] = 1
	laserWidth[i] = 3
}

laserFrequency = 60 //Modulation time for laser width

	//Calculated based on difference between origin and cannons in sprite
	laserOffsetLength[0] = sqrt(sqr(11) + sqr(7))
	laserOffsetAngle[0] = vectorAngle(0,0,11,7)

	laserOffsetLength[1] = laserOffsetLength[0]
	laserOffsetAngle[1] = (360 - laserOffsetAngle[0])


//Particle system for laser impact
particleFrameReset = 5 //How many frames does it take to activate/reactivate a burst

for (i = 0; i < numLasers; i++) {
	laserPartSystem[i] = part_system_create_layer("Instances",0)
	particleTimer[i] = 0
}

//Start timers
alarm_set(0,laserFrequency) //Laser modulation
