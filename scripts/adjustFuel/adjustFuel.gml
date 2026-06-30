function adjustFuel(amount, fuelContext = undefined){
    //Only objects with fuel variables can use generic fuel changes
    if (!variable_instance_exists(id, "currentFuel")) {
        return false
    }

    if (!variable_instance_exists(id, "maxFuel")) {
        return false
    }

    var previousFuel = currentFuel
    currentFuel = clamp(currentFuel + amount, 0, maxFuel)
    var actualChange = currentFuel - previousFuel

    //Allow this object to react to any fuel change
    if (variable_instance_exists(id, "onFuelChanged") && is_callable(onFuelChanged)) {
        onFuelChanged(actualChange, fuelContext)
    }

    //Allow this object to react when fuel is fully depleted
    if (previousFuel > 0 && currentFuel <= 0) {
        if (variable_instance_exists(id, "onFuelEmpty") && is_callable(onFuelEmpty)) {
            onFuelEmpty(fuelContext)
        }
    }

    return actualChange != 0
}
