varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float     u_fZFar;
uniform sampler2D u_sDepth;
uniform sampler2D u_sNormal;
uniform mat4      u_mInverseViewProj;

uniform vec4 u_vAmbientColour;
uniform vec4 u_vLightPosRange0;
uniform vec4 u_vLightPosRange1;
uniform vec4 u_vLightPosRange2;
uniform vec4 u_vLightPosRange3;
//uniform vec4 u_vLightPosRange4;
//uniform vec4 u_vLightPosRange5;
//uniform vec4 u_vLightPosRange6;
//uniform vec4 u_vLightPosRange7;
uniform vec4 u_vLightColour0;
uniform vec4 u_vLightColour1;
uniform vec4 u_vLightColour2;
uniform vec4 u_vLightColour3;
//uniform vec4 u_vLightColour4;
//uniform vec4 u_vLightColour5;
//uniform vec4 u_vLightColour6;
//uniform vec4 u_vLightColour7;

float UnpackDepth( vec3 colour ) {
    return clamp(float((colour.r)+(colour.g/255.0)+(colour.b/(255.0*255.0))), 0.0, 1.0);
}

float DoLight( vec3 ws_pos, vec3 ws_normal, vec4 posrange ) {
    vec3 delta = posrange.xyz - ws_pos;
    float dist = length( delta );
    return max( 0., dot( ws_normal, delta/dist ) ) * clamp( ( 1. - ( dist / posrange.w ) ), 0., 1. );
}

vec3 DoLightingCustom( vec3 ambient_colour, vec3 ws_pos, vec3 ws_norm ) {
    vec3 colour = ambient_colour;
    colour += u_vLightColour0.a * u_vLightColour0.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange0 );
    colour += u_vLightColour1.a * u_vLightColour1.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange1 );
    colour += u_vLightColour2.a * u_vLightColour2.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange2 );
    colour += u_vLightColour3.a * u_vLightColour3.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange3 );
    //colour += u_vLightColour4.a * u_vLightColour4.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange4 );
    //colour += u_vLightColour5.a * u_vLightColour5.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange5 );
    //colour += u_vLightColour6.a * u_vLightColour6.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange6 );
    //colour += u_vLightColour7.a * u_vLightColour7.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange7 );
    return min( colour, vec3(1.) );
}

void main() {
    
    float z_ = u_fZFar * UnpackDepth( texture2D( u_sDepth, v_vTexcoord ).rgb );
    vec3 posWS = vec3( 2.*v_vTexcoord.x - 1.,
                       1. - 2.*v_vTexcoord.y,
                                          z_ );
    posWS = (u_mInverseViewProj*vec4( posWS, 1. )).xyz;
    vec3 normalWS = texture2D( u_sDepth, v_vTexcoord ).rgb;
    
    gl_FragColor = v_vColour * vec4( DoLightingCustom( u_vAmbientColour.rgb, posWS, 2.*normalWS - 1. ), 1. ) * texture2D( gm_BaseTexture, v_vTexcoord );
    
}