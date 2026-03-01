/// @description Rotate

image_angle += angleIncrement

var dt = delta_time / 1000000;

switch (currentState)
{
	//If idle just spin around until distance to player is small enough
    case MineState.IDLE:
		image_angle += angleIncrement
        if (instance_exists(oPlayerSpaceship))
        {
            var dist = point_distance(x, y, oPlayerSpaceship.x, oPlayerSpaceship.y);

            if (dist <= triggerRadius)
            {
                currentState = MineState.TRIGGERED;
            }
        }

    break;
	//Charge for explodeTimer time and then boom
	case MineState.TRIGGERED:

        explodeTimer -= dt;

        if (explodeTimer <= 0)
        {
            instance_create_depth(x, y, 0, oMineExplosion);
            instance_destroy();
        }
}