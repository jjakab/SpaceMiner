// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hunterDroneTakeDamage(damage){
    if (!damageable) exit

    hp -= damage
    screenshake(3, .25, .05)

    if (hp <= 0)
    {
        instance_destroy()
        exit
    }

    currentState = DroneState.DISABLED
    disabledTimer = disabledDuration
}
