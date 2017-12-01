varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_fLine;

uniform float u_fTime;
uniform float u_fSmoothness;

void main() {
    
    float alpha = max( 0.0, min( 1.0, ( u_fTime - v_fLine ) / u_fSmoothness ) );
    gl_FragColor = vec4( v_vColour.rgb, alpha ) * texture2D( gm_BaseTexture, v_vTexcoord );
    
}
