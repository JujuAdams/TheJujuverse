varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float     u_fZFar;
uniform vec2      u_vTanAspect;
uniform sampler2D u_sDepth;
uniform sampler2D u_sNormal;
uniform mat4      u_mInverseView;

//uniform vec3 u_vFogColour; //RGB
//uniform vec3 u_vFogRange; //.x = start, .y = (end-start), .z = enable
//uniform vec4 u_vAmbientColour;
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

/*
vec3 DoLight( vec3 ws_pos, vec3 ws_normal, vec4 posrange, vec4 colour ) {
    
    vec3 delta = posrange.xyz - ws_pos;
    float dist = length( delta );
    
    vec3 diffuse_ = vec3(1.);
    float specular_ = 0.;
    
    if ( dist <= posrange.w ) {
        
        vec3 n_ws_normal = normalize( ws_normal );
        vec3 n_delta = normalize( delta );
        vec3 reflected = reflect( n_delta, n_ws_normal );
        vec3 n_ws_pos = normalize( ws_pos );
        
        //float lambert = dot( ws_normal, n_delta );
        //float attentuation = 1. - ( dist / posrange.w );
        //diffuse_ = colour.a * colour.rgb * max( 0., lambert ) * clamp( attentuation, 0., 1. );
        
        float specular_ = pow( max( dot( reflected, ws_pos ), 0. ), 1. );
        
    }
    
    return diffuse_ * ( 0. + specular_ );
    
}
*/
vec3 DoLightingCustom( vec3 ambientColour, vec3 ws_pos, vec3 ws_norm ) {
    vec3 colour = ambientColour;
    colour += DoLight( ws_pos, ws_norm, u_vLightPosRange0, u_vLightColour0 );
    colour += DoLight( ws_pos, ws_norm, u_vLightPosRange1, u_vLightColour1 );
    colour += DoLight( ws_pos, ws_norm, u_vLightPosRange2, u_vLightColour2 );
    colour += DoLight( ws_pos, ws_norm, u_vLightPosRange3, u_vLightColour3 );
    colour += DoLight( ws_pos, ws_norm, u_vLightPosRange4, u_vLightColour4 );
    colour += DoLight( ws_pos, ws_norm, u_vLightPosRange5, u_vLightColour5 );
    colour += DoLight( ws_pos, ws_norm, u_vLightPosRange6, u_vLightColour6 );
    colour += DoLight( ws_pos, ws_norm, u_vLightPosRange7, u_vLightColour7 );
    return min( colour, vec3(1.) );
}

void main() {
    vec4 sample = texture2D( u_sDepth, v_vTexcoord );
    float depth = RGBToDepth( sample.rgb );
    vec4 viewPos = InferViewPosition( v_vTexcoord, depth );
    vec3 normalWS = 2.*texture2D( u_sNormal, v_vTexcoord ).rgb - 1.;
    //float fogAmount = clamp( ( viewPos.z - u_vFogRange.x ) / u_vFogRange.y, 0., 1. ); 
    
    //gl_FragColor     = vec4( DoLightingCustom( u_vAmbientColour.rgb, (u_mInverseView*viewPos).xyz, normalWS ), 1. );
    //gl_FragColor.rgb = mix( gl_FragColor.rgb, u_vFogColour.rgb, fogAmount*u_vFogRange.z ); //Fog colour
    gl_FragColor     = vec4( DoLightingCustom( vec3(0.), (u_mInverseView*viewPos).xyz, normalWS ), 1. );
    gl_FragColor     = mix( gl_FragColor, vec4(1.), sample.a ); //Force colour
}