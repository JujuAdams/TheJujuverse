varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fAlpha;

void main() {
    gl_FragColor = vec4( v_vColour.rgb, v_vColour.a * u_fAlpha );
}
