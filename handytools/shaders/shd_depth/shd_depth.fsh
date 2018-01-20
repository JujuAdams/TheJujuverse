varying float v_fDepth;

vec3 DepthToRGB( float depth ) {
    return vec3( floor( depth * 255.0 ) / 255.0,
	             fract( depth * 255.0 ),
				 fract( depth * 255.0 * 255.0 ) );
}

void main() {
    gl_FragColor = vec4( DepthToRGB( v_fDepth ), 1. );
}