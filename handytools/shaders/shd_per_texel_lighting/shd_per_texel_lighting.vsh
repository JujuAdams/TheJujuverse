attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;
attribute vec3 in_Normal;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vPosWS;
varying vec4 v_vNormalWS;

uniform float u_fVibrate;
uniform float u_fGarbage;

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main() {
    
    vec4 object_space_pos = vec4( in_Position.xyz, 1.0 );
    object_space_pos.xyz += u_fVibrate*rand( (gm_Matrices[MATRIX_WORLD] * (object_space_pos + u_fGarbage) ).xy );
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos; 
    
    v_vColour   = in_Colour;
    v_vTexcoord = in_TextureCoord;
	v_vPosWS    = gm_Matrices[MATRIX_WORLD] * object_space_pos;
	v_vNormalWS = gm_Matrices[MATRIX_WORLD] * vec4( in_Normal, 0.0 );
    v_vNormalWS /= -length( v_vNormalWS );
    
}