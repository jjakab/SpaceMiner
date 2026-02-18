function spawnTurret()
{
    var grid_w = ds_grid_width(wallGrid);
    var grid_h = ds_grid_height(wallGrid);
    
    var valid_positions = [];
    
    for (var gx = 1; gx < grid_w - 1; gx++)
    {
        for (var gy = 1; gy < grid_h - 1; gy++)
        {
            // Must sit on a wall
            if (wallGrid[# gx, gy] != 1) continue;
            // NORTH (0)
            if (
                wallGrid[# gx, gy - 1] == 0 &&
                wallGrid[# gx - 1, gy] == 0 &&
                wallGrid[# gx + 1, gy] == 0 &&
                wallGrid[# gx - 1, gy - 1] == 0 &&
                wallGrid[# gx + 1, gy - 1] == 0
            )
            {
                array_push(valid_positions, {gx: gx, gy: gy, dir: 0});
            }
            // EAST (1)
            if (
                wallGrid[# gx + 1, gy] == 0 &&
                wallGrid[# gx, gy - 1] == 0 &&
                wallGrid[# gx, gy + 1] == 0 &&
                wallGrid[# gx + 1, gy - 1] == 0 &&
                wallGrid[# gx + 1, gy + 1] == 0
            )
            {
                array_push(valid_positions, {gx: gx, gy: gy, dir: 1});
            }
            // SOUTH (2)
            if (
                wallGrid[# gx, gy + 1] == 0 &&
                wallGrid[# gx - 1, gy] == 0 &&
                wallGrid[# gx + 1, gy] == 0 &&
                wallGrid[# gx - 1, gy + 1] == 0 &&
                wallGrid[# gx + 1, gy + 1] == 0
            )
            {
                array_push(valid_positions, {gx: gx, gy: gy, dir: 2});
            }
            // WEST (3)
            if (
                wallGrid[# gx - 1, gy] == 0 &&
                wallGrid[# gx, gy - 1] == 0 &&
                wallGrid[# gx, gy + 1] == 0 &&
                wallGrid[# gx - 1, gy - 1] == 0 &&
                wallGrid[# gx - 1, gy + 1] == 0
            )
            {
                array_push(valid_positions, {gx: gx, gy: gy, dir: 3});
            }
        }
    }
    
    return valid_positions;
}