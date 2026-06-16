function generateTurretLocations()
{
    var grid_w = ds_grid_width(wallGrid);
    var grid_h = ds_grid_height(wallGrid);
    var forwardClearance = 2;
    
    var valid_positions = [];
	
	function hasForwardClearance(_wallGrid, _gx, _gy, _dir, _distance, _gridW, _gridH)
	{
		for (var step = 1; step <= _distance; step++)
		{
			var checkX = _gx;
			var checkY = _gy;
			
			switch (_dir)
			{
				case 0:
					checkY -= step;
				break;
				
				case 1:
					checkX += step;
				break;
				
				case 2:
					checkY += step;
				break;
				
				case 3:
					checkX -= step;
				break;
			}
			
			if (checkX < 0 || checkX >= _gridW || checkY < 0 || checkY >= _gridH) return false;
			if (_wallGrid[# checkX, checkY] != 0) return false;
		}
		
		return true;
	}
    
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
                wallGrid[# gx + 1, gy - 1] == 0 &&
                hasForwardClearance(wallGrid, gx, gy, 0, forwardClearance, grid_w, grid_h)
            )
            {
                array_push(valid_positions, {gx: gx, gy: gy, dir: 0});
            }
            // EAST (1)
            else if (
                wallGrid[# gx + 1, gy] == 0 &&
                wallGrid[# gx, gy - 1] == 0 &&
                wallGrid[# gx, gy + 1] == 0 &&
                wallGrid[# gx + 1, gy - 1] == 0 &&
                wallGrid[# gx + 1, gy + 1] == 0 &&
                hasForwardClearance(wallGrid, gx, gy, 1, forwardClearance, grid_w, grid_h)
            )
            {
                array_push(valid_positions, {gx: gx, gy: gy, dir: 1});
            }
            // SOUTH (2)
            else if (
                wallGrid[# gx, gy + 1] == 0 &&
                wallGrid[# gx - 1, gy] == 0 &&
                wallGrid[# gx + 1, gy] == 0 &&
                wallGrid[# gx - 1, gy + 1] == 0 &&
                wallGrid[# gx + 1, gy + 1] == 0 &&
                hasForwardClearance(wallGrid, gx, gy, 2, forwardClearance, grid_w, grid_h)
            )
            {
                array_push(valid_positions, {gx: gx, gy: gy, dir: 2});
            }
            // WEST (3)
            else if (
                wallGrid[# gx - 1, gy] == 0 &&
                wallGrid[# gx, gy - 1] == 0 &&
                wallGrid[# gx, gy + 1] == 0 &&
                wallGrid[# gx - 1, gy - 1] == 0 &&
                wallGrid[# gx - 1, gy + 1] == 0 &&
                hasForwardClearance(wallGrid, gx, gy, 3, forwardClearance, grid_w, grid_h)
            )
            {
                array_push(valid_positions, {gx: gx, gy: gy, dir: 3});
            }
        }
    }
    
    return valid_positions;
}
