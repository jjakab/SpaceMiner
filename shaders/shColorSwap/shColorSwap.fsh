//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float range;
uniform vec4 colorMatch;
uniform vec4 colorReplace;

void main()
{
	vec4 pixelColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	//Convert GML 255-bit color to be 0-1
	float newRange = range / 255.0;
	
	//Check if all three of red green and blue ranges match
	if(abs(pixelColor.r - colorMatch.r) <= newRange) {
		if(abs(pixelColor.g - colorMatch.g) <= newRange) {
			if(abs(pixelColor.b - colorMatch.b) <= newRange) {
				pixelColor.rgb = colorReplace.rgb;
			}
		}
		
	}
	
    gl_FragColor = pixelColor;
}
