/// @description Insert description here
if(surface_exists(application_surface)) {
	
	//Set shader
	shader_set(shColorSwap)
	
	//Set range tolerance - we use 1 since we know match is exact
	shader_set_uniform_f(sh_handle_range,100)

	//Set values for foreground match color
	shader_set_uniform_f(sh_handle_match_fore,
		colorMatchFore.toShaderValue(colorMatchFore.red),
		colorMatchFore.toShaderValue(colorMatchFore.green),
		colorMatchFore.toShaderValue(colorMatchFore.blue)
	);

	//Set values for foreground replace color
	shader_set_uniform_f(sh_handle_replace_fore,
		colorReplaceFore.toShaderValue(colorReplaceFore.red),
		colorReplaceFore.toShaderValue(colorReplaceFore.green),
		colorReplaceFore.toShaderValue(colorReplaceFore.blue)
	);
	
	//Set values for backgroundground match color
	shader_set_uniform_f(sh_handle_match_back,
		colorMatchBack.toShaderValue(colorMatchBack.red),
		colorMatchBack.toShaderValue(colorMatchBack.green),
		colorMatchBack.toShaderValue(colorMatchBack.blue)
	);

	//Set values for foreground replace color
	shader_set_uniform_f(sh_handle_replace_back,
		colorReplaceBack.toShaderValue(colorReplaceBack.red),
		colorReplaceBack.toShaderValue(colorReplaceBack.green),
		colorReplaceBack.toShaderValue(colorReplaceBack.blue)
	);
	
	//Draw application surface with shader
	draw_surface(application_surface,0,0)
	
	//Reset shader afterwards
	shader_reset()
}
