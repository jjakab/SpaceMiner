// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function singleBlockTakeDamage(damage){
	if(damageable) {
		hp -= damage
		screenshake(5,.5,.1)
		if(hp <= 0) {
			instance_destroy()	
		}
	}
}