// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shaderCreate(){

	//Shaders
	Color = function(r,g,b) constructor {
		red = r;
		green = g;
		blue = b;
	
		static toShaderValue = function(value) {
			return value / 255;	
		}
	};

	colorMatch = new Color(255,255,255);
	colorReplace = new Color(
		color_get_red(currentForegroundColor),
		color_get_green(currentForegroundColor),
		color_get_blue(currentForegroundColor)
	);

	sh_handle_range = shader_get_uniform(shColorSwap, "range");
	sh_handle_match = shader_get_uniform(shColorSwap, "colorMatch");
	sh_handle_replace = shader_get_uniform(shColorSwap, "colorReplace");

}