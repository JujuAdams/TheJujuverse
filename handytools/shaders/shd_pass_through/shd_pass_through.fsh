varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

void main() {
    
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
}