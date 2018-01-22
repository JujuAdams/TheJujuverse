varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vLightColour;

uniform vec4 u_vForceColour;

void main() {
    gl_FragColor  = mix( v_vLightColour, vec4( u_vForceColour.rgb, 1.0 ), u_vForceColour.a );
    gl_FragColor *= v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}