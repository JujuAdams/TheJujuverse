varying vec2 v_vTexcoord;

uniform vec4 u_fUVs;
uniform float u_fSineOffset;
uniform float u_fIntensity;
uniform float u_fRepeats;

void main() {
    
    vec2 coords = ( v_vTexcoord.xy - u_fUVs.xy ) / u_fUVs.zw;
	if ( coords.y <= 0.5 ) discard;
	
    float dist = distance( vec2( 0.5, 0.5 ), coords );
    vec2 displacement = vec2( 0.5 ) + ( vec2( 0.5 ) - coords ) * sin( u_fRepeats * 6.28318 * ( dist + u_fSineOffset ) );
	float alpha = u_fIntensity * ( 1.0 - 2.0 * dist );
    gl_FragColor = vec4( displacement, 0.0, alpha );
    
}