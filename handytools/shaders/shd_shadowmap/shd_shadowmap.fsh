varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float     u_fZFar;
uniform vec2      u_vTanAspect;
uniform sampler2D u_sDepth;
uniform sampler2D u_sNormal;
uniform sampler2D u_sLightDepth;
uniform mat4      u_mInverseView;
uniform mat4      u_mLightViewProj;

uniform float     u_fBias;
uniform float     u_fSoftness;
uniform vec3      u_vColour;
uniform vec2      u_vAspect;

uniform vec3 u_vFogColour; //RGB
uniform vec3 u_vFogRange; //.x = start, .y = (end-start), .z = enable
uniform vec4 u_vAmbientColour;

float RGBToDepth( vec3 colour ) {
	colour /= vec3( 1., 255., 255.*255. );
    return clamp( colour.r + colour.g + colour.b,    0.0, 1.0 );
}
/*
float RGBAToDepth( vec4 colour ) {
	colour /= vec4( 1., 255., 255.*255., 255.*255.*255. );
    return clamp( colour.r + colour.g + colour.b + colour.a,    0.0, 1.0 );
}
*/
vec4 InferViewPosition( vec2 texCoord, float depth ) {
    //With thanks to kraifpatrik!
    return vec4( u_fZFar * depth * u_vTanAspect * ( 2.*texCoord - 1. ), u_fZFar * depth, 1. );
}


vec3 DoLight( vec3 ws_pos, vec3 ws_normal, vec4 posrange, vec4 colour ) {
    vec3 delta = posrange.xyz - ws_pos;
    float dist = length( delta );
    return colour.a * colour.rgb * max( 0., dot( ws_normal, delta/dist ) ) * clamp( ( 1. - ( dist / posrange.w ) ), 0., 1. );
}

void main() {
    
    gl_FragColor = vec4( u_vAmbientColour.rgb, 1. );
    
    vec4 sample = texture2D( u_sDepth, v_vTexcoord );
    float depth = RGBToDepth( sample.rgb );
    
    vec4  viewPos = InferViewPosition( v_vTexcoord, depth );
    vec3 worldPos = ( u_mInverseView * viewPos ).xyz;
    vec3 normalWS = 2.*texture2D( u_sNormal, v_vTexcoord ).rgb - 1.;

	vec4 shadowPos = ( u_mLightViewProj * vec4( worldPos, 1. ) );
    
    float shadowDepth = shadowPos.z / u_fZFar;
    vec2 shadowUV = .5 + .5*shadowPos.xy/shadowPos.z;
    float lightDepth = RGBToDepth( texture2D( u_sLightDepth, shadowUV ).rgb );
    float dist = length( ( shadowUV - .5 ) * u_vAspect );
    gl_FragColor.rgb +=   u_vColour                                           //Colour
                        * step( shadowDepth, lightDepth + u_fBias )           //If our world sample is in front of the occluder
                        * step( 0., shadowDepth )                             //If our world sample is in front of the light source
                        * pow( smoothstep( 1., 0., 2.*dist ), u_fSoftness );  //Circular light
    
    float fogAmount = clamp( ( viewPos.z - u_vFogRange.x ) / u_vFogRange.y, 0., 1. ); 
    gl_FragColor.rgb = mix( gl_FragColor.rgb, u_vFogColour.rgb, fogAmount*u_vFogRange.z ); //Fog colour
    gl_FragColor     = mix( gl_FragColor, vec4(1.), sample.a ); //Force colour
    
}