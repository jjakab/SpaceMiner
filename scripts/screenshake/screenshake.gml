//Pass arguments for a screenshake
function screenshake(time,magnitude,fade){
	
	with(oCamera) {
		shake = true
		shakeTime = time
		shakeMagnitude = magnitude
		shakeFade = fade
	}

}