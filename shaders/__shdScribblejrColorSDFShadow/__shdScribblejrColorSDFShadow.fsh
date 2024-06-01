varying float v_fAlpha;
varying vec2  v_vTexcoord;

uniform vec4 u_vColorSoftness;

void main()
{
    float sdfDistance = texture2D(gm_BaseTexture, v_vTexcoord).a;
    float range = max(fwidth(sdfDistance), 0.001) / sqrt(2.0);
    float alpha = smoothstep(0.5 - u_vColorSoftness.a, 0.5 + u_vColorSoftness.a, sdfDistance);
    gl_FragColor = vec4(u_vColorSoftness.rgb, alpha*v_fAlpha);
}
