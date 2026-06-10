// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shaderCreate(){

	//Constructor for a new Color
	Color = function(r,g,b) constructor {
		red = r;
		green = g;
		blue = b;
	
		static toShaderValue = function(value) {
			return value / 255;	
		}
	};

	//Declare two new colors for foreground
	colorMatchFore = new Color(255,255,255); //White
	colorReplaceFore = new Color(
		color_get_red(global.currentForegroundColor),
		color_get_green(global.currentForegroundColor),
		color_get_blue(global.currentForegroundColor)
	);
	
	//Declare two new colors for background
	colorMatchBack = new Color(63,63,116); //Dark blue
	colorReplaceBack = new Color(
		color_get_red(global.currentBackgroundColor),
		color_get_green(global.currentBackgroundColor),
		color_get_blue(global.currentBackgroundColor)
	);

	//Get handle of range
	sh_handle_range = shader_get_uniform(shColorSwap, "range");
	
	//Get handle of foreground colors
	sh_handle_match_fore = shader_get_uniform(shColorSwap, "colorMatchFore");
	sh_handle_replace_fore = shader_get_uniform(shColorSwap, "colorReplaceFore");
	
	//Get handle of background colors
	sh_handle_match_back = shader_get_uniform(shColorSwap, "colorMatchBack");
	sh_handle_replace_back = shader_get_uniform(shColorSwap, "colorReplaceBack");

}