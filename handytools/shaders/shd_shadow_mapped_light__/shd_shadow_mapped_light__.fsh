varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float     u_fZFar;
uniform vec2      u_vTanAspect;
uniform sampler2D u_sDepth;
uniform sampler2D u_sNormal;
uniform mat4      u_mInverseView;
uniform mat4      u_mLightViewProj;

uniform sampler2D u_sLightDepth;
uniform float     u_fBias;
uniform vec3      u_vColour;
uniform vec4      u_vSpriteUVs; //LTWH
uniform vec3      u_vLightDir;

float RGBToDepth( vec3 colour ) {
	colour /= vec3( 1., 255., 255.*255. );
    return clamp( colour.r + colour.g + colour.b,    0.0, 1.0 );
}

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
    
    gl_FragColor = vec4( 0., 0., 0., 1. );
    
    vec2 adjTexcoord = ( v_vTexcoord - u_vSpriteUVs.xy ) / u_vSpriteUVs.zw;
    vec4 sample = texture2D( u_sDepth, adjTexcoord );
    float depth = RGBToDepth( sample.rgb );
    vec3 worldPos = ( u_mInverseView * InferViewPosition( adjTexcoord, depth ) ).xyz;
    
    ///Lots of branching.... :( :( :(
    vec3 normalWS = normalize( 2.*texture2D( u_sNormal, adjTexcoord ).rgb - 1. );
	float NdotL = max( 0., dot( normalWS, -normalize( u_vLightDir ) ) ); //Find the normal between the surface and the light source
    if ( NdotL > 0. ) { //If we're on a front-facing surface
        
    	vec4 shadowPos = ( u_mLightViewProj * vec4( worldPos, 1. ) ); //Find the position of this texel in the light's ViewProj-space
        if ( shadowPos.z > 0. ) { //If we're in front of the light
        
            float shadowDepth = shadowPos.z / u_fZFar;
            vec2 shadowUV = clamp( .5 + .5*shadowPos.xy/shadowPos.z, 0., 1. ); //Find the UV coordinate on the light's surface
            
            if ( ( shadowUV.x > 0. ) && ( shadowUV.y > 0. ) &&
                 ( shadowUV.x < 1. ) && ( shadowUV.y < 1. ) ) { //If this texel is actually on the depth surface
                
                float lightDepth = RGBToDepth( texture2D( u_sLightDepth, shadowUV ).rgb );
                
                if ( lightDepth + u_fBias > shadowDepth ) {  //If our world sample is in front of the occluder
                    gl_FragColor.rgb += u_vColour * texture2D( gm_BaseTexture, u_vSpriteUVs.xy + shadowUV * u_vSpriteUVs.zw ).rgb; //Sample the light!
                    gl_FragColor = mix( gl_FragColor, vec4(1.), sample.a ); //Force colour
                }
            
            }
            
        }
        
    }
    
}