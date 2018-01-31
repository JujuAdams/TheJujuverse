attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;
attribute vec3 in_Normal;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosVS;
varying vec3 v_vNormalVS;
varying mat4 v_mView;

uniform float u_fVibrate;
uniform float u_fGarbage;

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main() {
    
    vec4 posOS = vec4( in_Position.xyz, 1.0 );
    posOS.xyz += u_fVibrate*rand( (gm_Matrices[MATRIX_WORLD]*(posOS + u_fGarbage) ).xy );
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*posOS; 
    
    v_vColour   = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    v_vPosVS    = (gm_Matrices[MATRIX_WORLD_VIEW]*posOS).xyz;
    v_vNormalVS = normalize( (gm_Matrices[MATRIX_WORLD_VIEW]*vec4( in_Normal, 0. )).xyz );
    v_mView     = gm_Matrices[MATRIX_VIEW];
    
}