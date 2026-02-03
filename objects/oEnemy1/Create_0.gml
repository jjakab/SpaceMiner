/// @description Initialize variables

//Declare enum for states
enum state
{
	idle,
	seekingPlayer,
	shootingLaser
	
}

//Settings for pathfinding
//mp_potential_settings(10,60,60,true)


//Start off in idle
playerState = state.seekingPlayer

//Idle variables
rangeToActivate = 500 //How far does this need to be from the player to activate

//seekingPlayer variables
moveSpeed = .2
rangeToShoot = 150
maxTurnSpeedMoving = 1

//shootingLaser variables
maxTurnSpeedShooting = 0.5
laserLengthCap = 200
currLaserLength = 0
laserIncrementRate = 2
laserWidth = 3
laserFrequency = 60 //Modulation time for laser width

alarm_set(0,laserFrequency)