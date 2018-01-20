attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying float v_fDepth;

uniform float u_fZFar;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position.xyz, 1. );
    v_fDepth = gl_Position.z / u_fZFar;
}
