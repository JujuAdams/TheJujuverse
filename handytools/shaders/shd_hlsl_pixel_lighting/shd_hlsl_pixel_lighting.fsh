struct PS {
    float4 Position   : SV_Position;
    float2 Texcoord   : TEXCOORD0;
    float4 Colour     : COLOR0;
    float3 Normal     : NORMAL0;
    float4 PositionWS : POSITION1;
    float3 NormalWS   : NORMAL1;
    float  Depth      : TEXCOORD1;
};

struct OUTPUT {
    float4 Colour0 : SV_Target0;
    float4 Colour1 : SV_Target1;
    float4 Colour2 : SV_Target2;
};

uniform float4 u_vAmbientColour;
uniform float4 u_vForceColour;
uniform float4 u_vLightPosRange0;
uniform float4 u_vLightPosRange1;
uniform float4 u_vLightPosRange2;
uniform float4 u_vLightPosRange3;
uniform float4 u_vLightPosRange4;
uniform float4 u_vLightPosRange5;
uniform float4 u_vLightPosRange6;
uniform float4 u_vLightPosRange7;
uniform float4 u_vLightColour0;
uniform float4 u_vLightColour1;
uniform float4 u_vLightColour2;
uniform float4 u_vLightColour3;
uniform float4 u_vLightColour4;
uniform float4 u_vLightColour5;
uniform float4 u_vLightColour6;
uniform float4 u_vLightColour7;

float DoLight( float3 ws_pos, float3 ws_normal, float4 posrange ) {
    float3 delta = posrange.xyz - ws_pos;
    float dist = length( delta );
    return max( 0.0, dot( ws_normal, delta/dist ) ) * clamp( ( 1.0 - ( dist / posrange.w ) ), 0.0, 1.0 );
}

float3 DoLightingCustom( float3 ambient_colour, float3 ws_pos, float3 ws_norm ) {
    float3 colour = ambient_colour;
    colour += u_vLightColour0.a * u_vLightColour0.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange0 );
    colour += u_vLightColour1.a * u_vLightColour1.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange1 );
    colour += u_vLightColour2.a * u_vLightColour2.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange2 );
    colour += u_vLightColour3.a * u_vLightColour3.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange3 );
    colour += u_vLightColour4.a * u_vLightColour4.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange4 );
    colour += u_vLightColour5.a * u_vLightColour5.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange5 );
    colour += u_vLightColour6.a * u_vLightColour6.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange6 );
    colour += u_vLightColour7.a * u_vLightColour7.rgb * DoLight( ws_pos, ws_norm, u_vLightPosRange7 );
    return min( colour, float3( 1.0, 1.0, 1.0 ) );
}

float3 PackDepth( float f ) {
    return float3( floor( f * 255.0 ) / 255.0, frac( f * 255.0 ), frac( f * 255.0 * 255.0 ) );
}

OUTPUT main(PS In) {
    OUTPUT Out;
    Out.Colour0  = float4( DoLightingCustom( u_vAmbientColour.rgb, In.PositionWS.xyz, In.NormalWS ), 1.0 );
    Out.Colour0  = lerp( In.Colour*Out.Colour0, float4( u_vForceColour.rgb, 1.0 ), u_vForceColour.a );
    Out.Colour0 *= gm_BaseTextureObject.Sample( gm_BaseTexture, In.Texcoord );
    Out.Colour1  = float4( PackDepth( In.Depth ), 1. );
    Out.Colour2  = float4( .5 + .5*In.NormalWS, 1. );
    return Out;
}