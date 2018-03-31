varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosVS;
varying vec3 v_vNormalVS;
varying mat4 v_mView;

uniform vec4  u_vAmbientColour;
uniform vec4  u_vForceColour;
uniform float u_fSpecular;
uniform vec4  u_vLightPosRange0;
uniform vec4  u_vLightPosRange1;
uniform vec4  u_vLightPosRange2;
uniform vec4  u_vLightPosRange3;
uniform vec4  u_vLightPosRange4;
uniform vec4  u_vLightPosRange5;
uniform vec4  u_vLightPosRange6;
uniform vec4  u_vLightPosRange7;
uniform vec4  u_vLightColour0;
uniform vec4  u_vLightColour1;
uniform vec4  u_vLightColour2;
uniform vec4  u_vLightColour3;
uniform vec4  u_vLightColour4;
uniform vec4  u_vLightColour5;
uniform vec4  u_vLightColour6;
uniform vec4  u_vLightColour7;

float DoLight( vec4 posrange ) {
    vec3 delta = (v_mView*vec4( posrange.xyz, 1. )).xyz - v_vPosVS;
    float dist = length( delta );
    return max( 0., dot( v_vNormalVS, delta/dist ) ) * clamp( 1. - dist/posrange.w, 0., 1. );
}

float DoSpecular( vec4 posrange ) {
    vec3 delta = (v_mView*vec4( posrange.xyz, 1. )).xyz - v_vPosVS;
    float dist = length( delta );
    vec3 eye = normalize( -v_vPosVS );
    vec3 reflected = reflect( normalize( -delta ), v_vNormalVS );
    return pow( max( dot( reflected, eye ), 0. ), 100. ) * clamp( 1. - dist/posrange.w, 0., 1. );
}

vec3 DoLightingCustom() {
    vec3 colour  = u_vLightColour0.a * u_vLightColour0.rgb * DoLight( u_vLightPosRange0 );
         colour += u_vLightColour1.a * u_vLightColour1.rgb * DoLight( u_vLightPosRange1 );
         colour += u_vLightColour2.a * u_vLightColour2.rgb * DoLight( u_vLightPosRange2 );
         colour += u_vLightColour3.a * u_vLightColour3.rgb * DoLight( u_vLightPosRange3 );
         colour += u_vLightColour4.a * u_vLightColour4.rgb * DoLight( u_vLightPosRange4 );
         colour += u_vLightColour5.a * u_vLightColour5.rgb * DoLight( u_vLightPosRange5 );
         colour += u_vLightColour6.a * u_vLightColour6.rgb * DoLight( u_vLightPosRange6 );
         colour += u_vLightColour7.a * u_vLightColour7.rgb * DoLight( u_vLightPosRange7 );
    return min( colour, vec3(1.) );
}

float DoLightingSpecular() {
    float colour  = DoSpecular( u_vLightPosRange0 );
          colour += DoSpecular( u_vLightPosRange1 );
          colour += DoSpecular( u_vLightPosRange2 );
          colour += DoSpecular( u_vLightPosRange3 );
          colour += DoSpecular( u_vLightPosRange4 );
          colour += DoSpecular( u_vLightPosRange5 );
          colour += DoSpecular( u_vLightPosRange6 );
          colour += DoSpecular( u_vLightPosRange7 );
    return min( colour, 1. );
}

void main() {
    gl_FragColor      = vec4( u_vAmbientColour.rgb, 1. );
    gl_FragColor.rgb += DoLightingCustom();
    gl_FragColor     *= v_vColour*texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor      = mix( gl_FragColor, vec4( u_vForceColour.rgb, 1. ), u_vForceColour.a );
    gl_FragColor.rgb += u_fSpecular*DoLightingSpecular();
}