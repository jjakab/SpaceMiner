/// @description Handle bullet collisions

image_angle = direction

//Destroy the bullet if it hits terrain
if (place_meeting(x, y, oTerrainMaster))
{
    instance_destroy()
    exit
}

//Apply a light penalty on hit so bullets matter without being overwhelming
if (place_meeting(x, y, oPlayerSpaceship))
{
    with (oPlayerSpaceship)
    {
        oPlayerSpaceship.currentFuel = max(0, currentFuel - 5)
    }

    instance_destroy()
}
