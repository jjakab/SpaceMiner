function takeDamage(damage, damageContext = undefined){
	//Ideally we never call this on an object that cannot take damage or doesn't have hp, failsafes
    //If this object is not damageable, ignore the hit
    if (!variable_instance_exists(id, "damageable") || !damageable) {
        return false
    }

    //If this object has no hp, it cannot use generic damage
    if (!variable_instance_exists(id, "hp")) {
        return false
    }
	
    hp -= damage

    //Allow this object to react to being hit
    if (variable_instance_exists(id, "onDamage") && is_callable(onDamage)) {
        onDamage(damage, damageContext)
    }

    //Destroy the object if damage reduced hp to zero
    if (hp <= 0) {
        if (variable_instance_exists(id, "onDeath") && is_callable(onDeath)) {
            onDeath(damageContext)
        }

        instance_destroy()
    }

    return true
}
