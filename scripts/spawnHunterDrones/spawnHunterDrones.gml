// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnHunterDrones(numDrones){

    var oreCount = instance_number(oTerrainOre)

    if (oreCount <= 0) exit

    numDrones = min(numDrones, oreCount)

    var usedOreIndices = array_create(oreCount, false)

    for (var i = 0; i < numDrones; i++)
    {
        var oreIndex = irandom(oreCount - 1)
        var attempts = 0

        while (usedOreIndices[oreIndex] && attempts < oreCount)
        {
            oreIndex = (oreIndex + 1) mod oreCount
            attempts++
        }

        if (usedOreIndices[oreIndex]) break

        usedOreIndices[oreIndex] = true

        var oreAnchor = instance_find(oTerrainOre, oreIndex)

        if (oreAnchor == noone) continue

        var spawnAngle = irandom(359)
        var spawnRadius = 24 + irandom(24)
        var spawnX = oreAnchor.x + lengthdir_x(spawnRadius, spawnAngle)
        var spawnY = oreAnchor.y + lengthdir_y(spawnRadius, spawnAngle)

        if (collision_circle(spawnX, spawnY, 8, oTerrainMaster, false, true))
        {
            continue
        }

        var spawnedDrone = instance_create_depth(spawnX, spawnY, 0, oHunterDrone)
        spawnedDrone.patrolAnchor = oreAnchor
        spawnedDrone.patrolRadius = spawnRadius
        spawnedDrone.patrolTargetX = oreAnchor.x + lengthdir_x(spawnRadius, spawnAngle)
        spawnedDrone.patrolTargetY = oreAnchor.y + lengthdir_y(spawnRadius, spawnAngle)
    }
}
