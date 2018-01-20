//
// Simple passthrough vertex shader
//
attribute vec2 in_Position;                  // (x,y)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec4 in_Colour;                    // (r,g,b,a)

uniform float u_fDepth;
uniform vec2  u_vScale;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

void main()
{
  vec4 pos = vec4( (u_vScale.xy * in_Position.xy).xy, 1.0, 1.0);
  gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * pos;
    
  v_vColour   = in_Colour;
  v_vTexcoord = in_TextureCoord;
  v_vPosition = in_Position.xy;
}
