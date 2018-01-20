//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform vec4 u_vClip_rect;

void main()
{
  gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
  if (v_vPosition.x < u_vClip_rect.x || v_vPosition.x > u_vClip_rect.z ||
      v_vPosition.y < u_vClip_rect.y || v_vPosition.y > u_vClip_rect.w) 
      gl_FragColor.a = 0.0;
}
