varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_fLine;
varying float v_fIndex;

uniform vec4 u_vColour;

void main() {
    
    gl_FragColor = u_vColour * v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
}