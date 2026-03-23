// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function resolveTerrainMovement(xSpeed, ySpeed){

    var resolvedXSpeed = xSpeed
    var resolvedYSpeed = ySpeed
    var hitTerrain = false

    //Check collision in the x direction
    if (place_meeting(x + resolvedXSpeed, y, oTerrainMaster))
    {
        if (place_meeting(x + resolvedXSpeed, y, oTerrainSingleBlock))
        {
            hitTerrain = true
            resolvedXSpeed = 0
        }
        else if (place_meeting(x + resolvedXSpeed, y, oTerrainLarge))
        {
            var largeTerrainX = instance_place(x + resolvedXSpeed, y, oTerrainLarge)

            if (largeTerrainX.hasSpawnedChildren)
            {
                var listSizeX = ds_list_size(largeTerrainX.minilist)

                for (var j = 0; j < listSizeX; j++)
                {
                    if (instance_exists(ds_list_find_value(largeTerrainX.minilist, j)))
                    {
                        if (place_meeting(x + resolvedXSpeed, y, ds_list_find_value(largeTerrainX.minilist, j)))
                        {
                            hitTerrain = true
                            resolvedXSpeed = 0
                            break
                        }
                    }
                }
            }
        }
    }

    //Repeat for the y direction
    if (place_meeting(x, y + resolvedYSpeed, oTerrainMaster))
    {
        if (place_meeting(x, y + resolvedYSpeed, oTerrainSingleBlock))
        {
            hitTerrain = true
            resolvedYSpeed = 0
        }
        else if (place_meeting(x, y + resolvedYSpeed, oTerrainLarge))
        {
            var largeTerrainY = instance_place(x, y + resolvedYSpeed, oTerrainLarge)

            if (largeTerrainY.hasSpawnedChildren)
            {
                var listSizeY = ds_list_size(largeTerrainY.minilist)

                for (var k = 0; k < listSizeY; k++)
                {
                    if (instance_exists(ds_list_find_value(largeTerrainY.minilist, k)))
                    {
                        if (place_meeting(x, y + resolvedYSpeed, ds_list_find_value(largeTerrainY.minilist, k)))
                        {
                            hitTerrain = true
                            resolvedYSpeed = 0
                            break
                        }
                    }
                }
            }
        }
    }

    return {
        xSpeed: resolvedXSpeed,
        ySpeed: resolvedYSpeed,
        hitTerrain: hitTerrain
    }
}
