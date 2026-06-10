/// @description Change colors

//Increment color counter
global.colorCounter++
if(global.colorCounter > (colorMaxCounter - 1)) global.colorCounter = 0

//Retrieve relevant colors from list and set global vars
global.currentForegroundColor = ds_list_find_value(foregroundColors,global.colorCounter)
global.currentBackgroundColor = ds_list_find_value(backgroundColors,global.colorCounter)

//Replace shader vars
colorReplaceFore.red = color_get_red(global.currentForegroundColor)
colorReplaceFore.green = color_get_green(global.currentForegroundColor)
colorReplaceFore.blue = color_get_blue(global.currentForegroundColor)

colorReplaceBack.red = color_get_red(global.currentBackgroundColor)
colorReplaceBack.green = color_get_green(global.currentBackgroundColor)
colorReplaceBack.blue = color_get_blue(global.currentBackgroundColor)

