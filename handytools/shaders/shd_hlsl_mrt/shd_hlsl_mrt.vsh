struct VS {
    float4 Position : POSITION0;
    float2 Texcoord : TEXCOORD0;
    float4 Colour   : COLOR0;
    float3 Normal   : NORMAL0;
};

struct PS {
    float4 Position   : SV_Position;
    float2 Texcoord   : TEXCOORD0;
    float4 Colour     : COLOR0;
    float3 Normal     : NORMAL0;
    float4 PositionWS : POSITION1;
    float3 NormalVS   : NORMAL1;
    float  Depth      : TEXCOORD1;
};

uniform float u_fZFar;

PS main(VS In) {
    PS Out;
    Out.Position   = mul( gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], In.Position );
    Out.Depth      = Out.Position.z / u_fZFar;
    Out.Texcoord   = In.Texcoord;
    Out.Colour     = In.Colour;
    Out.Normal     = In.Normal;
    Out.PositionWS = mul( gm_Matrices[MATRIX_WORLD], In.Position );
    Out.NormalVS   = normalize( mul( gm_Matrices[MATRIX_WORLD_VIEW], float4( In.Normal, 0. ) ).xyz );
    return Out;
}