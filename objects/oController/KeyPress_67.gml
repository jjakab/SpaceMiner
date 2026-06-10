/// @description Change colors

//Increment color counter
global.colorCounter++
if(global.colorCounter > (colorMaxCounter - 1)) global.colorCounter = 0

currentForegroundColor = ds_list_find_value(foregroundColors,global.colorCounter)
currentBackgroundColor = ds_list_find_value(backgroundColors,global.colorCounter)

colorReplace.red = color_get_red(currentForegroundColor)
colorReplace.green = color_get_green(currentForegroundColor)
colorReplace.red = color_get_blue(currentForegroundColor)

