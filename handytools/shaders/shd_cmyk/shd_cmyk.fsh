varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fAberration;

void main() {
    
    vec4 sample_o = texture2D( gm_BaseTexture, v_vTexcoord );
    vec4 sample_a = texture2D( gm_BaseTexture, v_vTexcoord + u_fAberration*vec2(  1.0/640.0,  0.0 ) );
    vec4 sample_b = texture2D( gm_BaseTexture, v_vTexcoord + u_fAberration*vec2( -1.0/640.0,  0.0 ) );
    vec4 sample_c = texture2D( gm_BaseTexture, v_vTexcoord + u_fAberration*vec2(  0.0,  2.0/360.0 ) );
    
    vec3 rgb_result = vec3( ( sample_a.r + sample_b.r )*0.5,
                            ( sample_b.g + sample_c.g )*0.5,
                            ( sample_c.b + sample_a.b )*0.5 );
    
    gl_FragColor = vec4( rgb_result, sample_o.a );
    
}