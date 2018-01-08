varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float     u_vDOF_centre;
uniform float     u_vDOF_range;
uniform sampler2D u_sDepth;
uniform sampler2D u_sBlur;

float UnpackDepth( vec3 colour ) {
    return clamp(float((colour.r)+(colour.g/255.0)+(colour.b/(255.0*255.0))), 0.0, 1.0);
}

void main() {
    float depth = UnpackDepth( texture2D( u_sDepth, v_vTexcoord ).rgb );
    float blur = clamp( abs( depth - u_vDOF_centre ) / u_vDOF_range, 0., 1. );
    gl_FragColor = v_vColour * mix( texture2D( gm_BaseTexture, v_vTexcoord ), texture2D( u_sBlur, v_vTexcoord ), blur );
}