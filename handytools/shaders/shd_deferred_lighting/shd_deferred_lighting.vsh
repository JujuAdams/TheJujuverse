attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    
    vec4 posOS = vec4( in_Position.xyz, 1. );
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*posOS;
    
    v_vColour   = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
}
