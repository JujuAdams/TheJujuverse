attribute vec2 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying float v_fAlpha;
varying vec2  v_vTexcoord;

uniform vec4 u_vPositionAlphaScale;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*vec4(in_Position*u_vPositionAlphaScale.w + u_vPositionAlphaScale.xy, 0.0, 1.0);
    v_fAlpha    = u_vPositionAlphaScale.z;
    v_vTexcoord = in_TextureCoord;
}