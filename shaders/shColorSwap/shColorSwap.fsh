//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float range;
uniform vec4 colorMatchFore;
uniform vec4 colorReplaceFore;
uniform vec4 colorMatchBack;
uniform vec4 colorReplaceBack;

void main()
{
	vec4 pixelColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	//Convert GML 255-bit color to be 0-1
	float newRange = range / 255.0;
	
	//Check if all three of red green and blue ranges match foreground match color
	if(abs(pixelColor.r - colorMatchFore.r) <= newRange) {
		if(abs(pixelColor.g - colorMatchFore.g) <= newRange) {
			if(abs(pixelColor.b - colorMatchFore.b) <= newRange) {
				pixelColor.rgb = colorReplaceFore.rgb;
			}
		}
		
	}
	
	else if(abs(pixelColor.r - colorMatchBack.r) <= newRange) {
		if(abs(pixelColor.g - colorMatchBack.g) <= newRange) {
			if(abs(pixelColor.b - colorMatchBack.b) <= newRange) {
				pixelColor.rgb = colorReplaceBack.rgb;
			}
		}
		
	}
	
    gl_FragColor = pixelColor;
}
