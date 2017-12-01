//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform vec4 Clip_rect;

void main()
{
  gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
  if (v_vPosition.x < Clip_rect.x || v_vPosition.x > Clip_rect.z ||
      v_vPosition.y < Clip_rect.y || v_vPosition.y > Clip_rect.w) 
      gl_FragColor.a = 0.0;
}
