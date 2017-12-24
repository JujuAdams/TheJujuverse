attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_fLine;
varying float v_fIndex;

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, 0.0, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_fIndex = float( int( in_Position.z / 256.0 ) );
    v_fLine = in_Position.z - v_fIndex*256.0;
    
}