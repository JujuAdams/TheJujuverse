varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float     u_fZFar;
uniform vec2      u_vTanAspect;
uniform sampler2D u_sDepth;
uniform sampler2D u_sNormal;
uniform mat4      u_mView;

uniform vec4 u_vLightPosRange0;
uniform vec4 u_vLightPosRange1;
uniform vec4 u_vLightPosRange2;
uniform vec4 u_vLightPosRange3;
uniform vec4 u_vLightPosRange4;
uniform vec4 u_vLightPosRange5;
uniform vec4 u_vLightPosRange6;
uniform vec4 u_vLightPosRange7;
uniform vec4 u_vLightColour0;
uniform vec4 u_vLightColour1;
uniform vec4 u_vLightColour2;
uniform vec4 u_vLightColour3;
uniform vec4 u_vLightColour4;
uniform vec4 u_vLightColour5;
uniform vec4 u_vLightColour6;
uniform vec4 u_vLightColour7;

float RGBToDepth( vec3 colour ) {
	colour /= vec3( 1., 255., 255.*255. );
    return clamp( colour.r + colour.g + colour.b,    0.0, 1.0 );
}

vec4 InferViewPosition( vec2 texCoord, float depth ) {
    //With thanks to kraifpatrik!
    return vec4( u_fZFar * depth * u_vTanAspect * ( 2.*texCoord - 1. ), u_fZFar * depth, 1. );
}


vec3 DoLight( vec3 vs_pos, vec3 vs_normal, vec4 posrange, vec4 colour ) {
    vec3 delta = (u_mView*vec4(posrange.xyz,1.)).xyz - vs_pos;
    float dist = length( delta );
    return colour.a * colour.rgb * max( 0., dot( vs_normal, delta/dist ) ) * clamp( 1. - dist/posrange.w, 0., 1. );
}

vec3 DoLightingCustom( vec3 vs_pos, vec3 vs_norm ) {
    vec3 colour  = DoLight( vs_pos, vs_norm, u_vLightPosRange0, u_vLightColour0 );
         colour += DoLight( vs_pos, vs_norm, u_vLightPosRange1, u_vLightColour1 );
         colour += DoLight( vs_pos, vs_norm, u_vLightPosRange2, u_vLightColour2 );
         colour += DoLight( vs_pos, vs_norm, u_vLightPosRange3, u_vLightColour3 );
         colour += DoLight( vs_pos, vs_norm, u_vLightPosRange4, u_vLightColour4 );
         colour += DoLight( vs_pos, vs_norm, u_vLightPosRange5, u_vLightColour5 );
         colour += DoLight( vs_pos, vs_norm, u_vLightPosRange6, u_vLightColour6 );
         colour += DoLight( vs_pos, vs_norm, u_vLightPosRange7, u_vLightColour7 );
    return min( colour, vec3(1.) );
}

void main() {
    
    vec4  sample   = texture2D( u_sDepth, v_vTexcoord );
    float depth    = RGBToDepth( sample.rgb );
    vec4  viewPos  = InferViewPosition( v_vTexcoord, depth );
    vec3  normalVS = 2.*texture2D( u_sNormal, v_vTexcoord ).rgb - 1.;
    
    gl_FragColor = vec4( DoLightingCustom( viewPos.xyz, normalVS ), 1. );
    gl_FragColor = mix( gl_FragColor, vec4(1.), sample.a );
    
}