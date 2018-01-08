const float RADIUS = 5.0; //Edit this

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_fTexelStep;

float sigmoid_curve( float v ) {
    v = 2.0*v - 1.0;
    return -v*0.5*abs(v) + v + 0.5;
}

void main() {
    
    vec4 colour = vec4(0.0);
    float divisor = 0.0;
    
    vec4 sample = vec4(0.0);
    float weight = 0.0;
    
    for( float i = -RADIUS; i <= RADIUS; i++) {
        sample = texture2D( gm_BaseTexture, v_vTexcoord + i*u_fTexelStep );
        weight = sigmoid_curve( 1.0 - (abs(i)/RADIUS) );
        colour += sample * weight;
        divisor += weight; 
    }
    
    gl_FragColor = colour/divisor;
    
}