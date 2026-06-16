/// @description Screenshake and create ore fragments
if (!variable_instance_exists(id, "didDeathEffects") && variable_instance_exists(id, "onDeath") && is_callable(onDeath)) {
	onDeath(undefined)
}
