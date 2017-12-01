varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTextureSize;
uniform sampler2D u_sDither;

float dither_find( vec2 pos, float value ){
    return step( (255.0/64.0) * texture2D( u_sDither, pos/8.0 ).r, floor( value * 200.0 ) / 128.0 );
}

float luma( vec4 colour ) {
    return ( (colour.r + colour.b + colour.g) / 3.0 );
}

void main() {
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = v_vColour * vec4( mix( col.rgb, col.rgb * dither_find( mod( v_vTexcoord * u_vTextureSize, 8.0 ), luma(col) ), 0.2 ), 1.0 );
}