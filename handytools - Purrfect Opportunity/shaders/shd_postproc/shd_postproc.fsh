varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fAberration_min;
uniform float u_fAberration_max;
uniform sampler2D u_sDisplacement;

void main() {
	
	vec4 displacement_sample = texture2D( u_sDisplacement, v_vTexcoord );
    vec2 displacement_coords = displacement_sample.rg - 0.5;
	vec2 realCoord = clamp( v_vTexcoord + 0.1 * displacement_coords, 0.0, 1.0 );
	float aberration = max( 0.0, mix( u_fAberration_min, u_fAberration_max, displacement_sample.b )-0.2 );
    /*
	float u_fFisheyeA = 50.0;
	float u_fFisheyeB = -0.02;
	float u_fFisheyeCutoff = 0.1;
	
    vec2 d = 0.5 - v_vTexcoord;
    realCoord = v_vTexcoord + d * pow( abs( u_fFisheyeA ), max( 0.0, length( d ) - u_fFisheyeCutoff ) ) * u_fFisheyeB;
	*/
	vec4 sample_o = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 sample_a = texture2D( gm_BaseTexture, realCoord + aberration*vec2(  1.0/640.0,  0.0 ) );
	vec4 sample_b = texture2D( gm_BaseTexture, realCoord + aberration*vec2( -1.0/640.0,  0.0 ) );
	vec4 sample_c = texture2D( gm_BaseTexture, realCoord + aberration*vec2(  0.0,  2.0/360.0 ) );
	vec3 rgb_result = vec3( ( sample_a.r + sample_b.r )*0.5,
						    ( sample_b.g + sample_c.g )*0.5,
	                        ( sample_c.b + sample_a.b )*0.5 );
	/*
	vec4 sample_o = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 sample_a = texture2D( gm_BaseTexture, realCoord + aberration*vec2(  1.0/640.0,  0.0 ) );
	vec4 sample_b = texture2D( gm_BaseTexture, realCoord + aberration*vec2( -1.0/640.0,  0.0 ) );
	vec4 sample_c = texture2D( gm_BaseTexture, realCoord + aberration*vec2(  0.0,  2.0/360.0 ) );
	vec3 rgb_result = vec3( sample_a*0.33 + sample_b*0.33 + sample_c*0.34 );
	*/
	gl_FragColor = vec4( mix( v_vColour.rgb, rgb_result, 1.0 ), sample_o.a );
    
}