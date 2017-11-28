varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_fLine;
varying float v_fIndex;

void main() {
    
    gl_FragColor = vec4( v_vColour.rgb, v_fLine / 34.0 ) * texture2D( gm_BaseTexture, v_vTexcoord );
    
}

