varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float     u_fZFar;
uniform vec2      u_vTanAspect;
uniform sampler2D u_sDepth;
uniform sampler2D u_sNormal;
uniform sampler2D u_sLightDepth;
uniform mat4      u_mInverseView;
uniform mat4      u_mLightViewProj;

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
    if ( shadowDepth >= 0. ) {
        
        vec2 shadowUV = .5 + .5*shadowPos.xy/shadowPos.z;
        /*if ( ( shadowUV.x >= 0. )
    	  && ( shadowUV.y >= 0. )
    	  && ( shadowUV.x <= 1. )
    	  && ( shadowUV.y <= 1. )
          && ( shadowDepth > 0. ) ) {*/
          
            float lightDepth = RGBToDepth( texture2D( u_sLightDepth, shadowUV ).rgb );
            if ( shadowDepth <= lightDepth + .001 ) {
                float dist = length( ( shadowUV - .5 ) * vec2( 1.3333333, 1. ) );
                gl_FragColor.rgb += pow( smoothstep( 1., 0., 2.*dist ), .1 );
            }
          
        //}
        
    }
    
    float fogAmount = clamp( ( viewPos.z - u_vFogRange.x ) / u_vFogRange.y, 0., 1. ); 
    gl_FragColor.rgb = mix( gl_FragColor.rgb, u_vFogColour.rgb, fogAmount*u_vFogRange.z ); //Fog colour
    gl_FragColor     = mix( gl_FragColor, vec4(1.), sample.a ); //Force colour
    
}