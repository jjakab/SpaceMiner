/// @description Insert description here
if(surface_exists(application_surface)) {
	
	shader_set(shColorSwap)
	
	shader_set_uniform_f(sh_handle_range,100)

	shader_set_uniform_f(sh_handle_match,
		colorMatch.toShaderValue(colorMatch.red),
		colorMatch.toShaderValue(colorMatch.green),
		colorMatch.toShaderValue(colorMatch.blue)
	);

	shader_set_uniform_f(sh_handle_replace,
		colorReplace.toShaderValue(colorReplace.red),
		colorReplace.toShaderValue(colorReplace.green),
		colorReplace.toShaderValue(colorReplace.blue)
	);
	
	draw_surface(application_surface,0,0)
	
	shader_reset()
}
