varying vec2 v_vTexcoord;

uniform vec2 u_vTexel;

const vec2  c_vStrength    = vec2( 5.0 );
const vec3  c_vLuminence   = vec3( 0.299, 0.587, 0.114 );
const float c_fSpanMax     = 8.0;
const float c_fReduceCoeff = 0.125;
const float c_fReduceMin   = 0.0078125;

void main( void ) {
 
    vec3 vNW = texture2D( gm_BaseTexture, v_vTexcoord +(vec2( -1.0, -1.0 ) * u_vTexel ) ).rgb;
    vec3 vNE = texture2D( gm_BaseTexture, v_vTexcoord +(vec2(  1.0, -1.0 ) * u_vTexel ) ).rgb;
    vec3 vSW = texture2D( gm_BaseTexture, v_vTexcoord +(vec2( -1.0,  1.0 ) * u_vTexel ) ).rgb;
    vec3 vSE = texture2D( gm_BaseTexture, v_vTexcoord +(vec2(  1.0,  1.0 ) * u_vTexel ) ).rgb;
    vec4 vC  = texture2D( gm_BaseTexture, v_vTexcoord );
	
    float fLumaNW = dot( vNW   , c_vLuminence );
    float fLumaNE = dot( vNE   , c_vLuminence );
    float fLumaSW = dot( vSW   , c_vLuminence );
    float fLumaSE = dot( vSE   , c_vLuminence );
    float fLumaM  = dot( vC.rgb, c_vLuminence );
    float fLumaMin = min(fLumaM, min(min(fLumaNW, fLumaNE), min(fLumaSW, fLumaSE)));
    float fLumaMax = max(fLumaM, max(max(fLumaNW, fLumaNE), max(fLumaSW, fLumaSE)));
	
    vec2 vSampleDir = vec2( (fLumaSW + fLumaSE) - (fLumaNW + fLumaNE), (fLumaNW + fLumaSW) - (fLumaNE + fLumaSE) );
	
	float fDirCoeff = (fLumaNW + fLumaNE + fLumaSW + fLumaSE)*0.25;
    fDirCoeff = max( fDirCoeff * c_fReduceCoeff, c_fReduceMin );
	
	vSampleDir = u_vTexel * clamp( vSampleDir / ( min( abs(vSampleDir.x), abs(vSampleDir.y) ) + fDirCoeff ), -c_vStrength, c_vStrength );
	
    vec3 vA = 0.5*( texture2D( gm_BaseTexture, v_vTexcoord - 0.16666667*vSampleDir ).rgb +
                    texture2D( gm_BaseTexture, v_vTexcoord + 0.16666667*vSampleDir ).rgb );
	
    vec3 vB = 0.5*( vA + 0.5*( texture2D( gm_BaseTexture, v_vTexcoord - 0.5*vSampleDir ).rgb +
                               texture2D( gm_BaseTexture, v_vTexcoord + 0.5*vSampleDir ).rgb ) );
	
    float fLumaB = dot( vB, c_vLuminence );
	gl_FragColor = vec4( ((fLumaB < fLumaMin) || (fLumaB > fLumaMax))?vA:vB, vC.a );
	
}