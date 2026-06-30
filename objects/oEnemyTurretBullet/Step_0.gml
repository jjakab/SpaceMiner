/// @description Handle bullet collisions

image_angle = direction

//Destroy the bullet if it hits terrain
if (place_meeting(x, y, oTerrainMaster))
{
    instance_destroy()
    exit
}

//Apply a light penalty on hit so bullets matter without being overwhelming
var hitPlayer = instance_place(x, y, oPlayerSpaceship)
if (hitPlayer != noone)
{
    with (hitPlayer)
    {
        adjustFuel(-5, "turret_bullet")
    }

    instance_destroy()
}
