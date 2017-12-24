varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_fIndex;

uniform float u_fTime;
uniform float u_fMaxTime;
uniform float u_fSmoothness;
uniform vec4  u_vColour;

void main() {
	
    float alpha = 1.0;
	if ( u_fTime <= u_fMaxTime ) {
		 alpha = max( 0.0, min( 1.0, ( u_fTime - v_fIndex ) / u_fSmoothness ) );
	} else {
		 alpha = 1.0 - max( 0.0, min( 1.0, ( (2.0*u_fMaxTime - u_fTime) - v_fIndex ) / u_fSmoothness ) );
	}
    gl_FragColor = u_vColour * vec4( v_vColour.rgb, alpha ) * texture2D( gm_BaseTexture, v_vTexcoord );
    
}
