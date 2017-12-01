/*
-texture needs border and black background

shader_set(shaderGlitch);
shader_set_uniform_f(shader_get_uniform(shaderGlitch, "resX"), sprite_get_width(sprImage));
shader_set_uniform_f(shader_get_uniform(shaderGlitch, "resY"), sprite_get_height(sprImage));
shader_set_uniform_f(shader_get_uniform(shaderGlitch, "time"), time);
draw_sprite(sprImage, 32, 32, 0);
shader_reset();
*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
float time2;
uniform float resX;
uniform float resY;

float downsample(float v, float res){
    return floor(v * res) / res;
}

float rand(vec2 co, float multiplier){
    return fract(sin((time2 * multiplier) + dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main()
{
  time2 = time;  
  float fade = max(0., sin(time * .5 + .2) * cos(time * .1) * .25 + .2);  
  float res2 = min(resX, (resX * 1.3) - ((resX / 2.) * ceil(rand(vec2(time, time * 2.), 1.) * fade * 1.5)));
  float pixelH = 1. / resX;
  float ratioX = 1.;
  float ratioY = 1.;
  if (resX > resY){
    ratioY = resY / resX;
  }else{
    ratioX = resX / resY;
  }
  float _x = floor((v_vTexcoord.x + downsample(sin(cos(-time * 14.2) * 0.5 + v_vTexcoord.y * sin(time * .5) * 40.), cos(time) * .5 + 1. + .2) * (sin(time * 0.5) * .05) * fade) * res2) / res2; 
  float _y = floor(v_vTexcoord.y * res2) / res2; 
  float squareSize = ceil(max(resX, resY) / min(resX, resY) * 64.);
  float xtra = (1. + (rand(vec2(_x, _y), 1.) * .99) * (.05 + fade * 1.1));
  
  //alpha calculations would have to be added to fix transparency k
  vec4 sampleA = texture2D(gm_BaseTexture, vec2(_x + pixelH * (fade * 10.), _y)) * xtra;  
  vec4 sampleB = texture2D(gm_BaseTexture, vec2(_x - pixelH * (fade * 10.), _y)) * xtra; 
  vec4 sampleC = texture2D(gm_BaseTexture, vec2(_x, _y)) * xtra; 
  float c1 =  ( sampleA.r + sampleB.r ) * .5;
  float c2 =  ( sampleB.g + sampleC.g ) * .5;
  float c3 =  ( sampleC.b + sampleA.b ) * .5;
  vec4 col =  vec4(c1, c2, c3, ( sampleA.a + sampleB.a + sampleC.a )/3. ); 
  
  vec4 col2 = vec4(0., 0., 0., 0.);
  float _l = downsample(_y, 10. + floor(cos(time2 * .5) * 5.));
  time2 = floor(time / (20. - _l)) * (20. - _l);
  for (float i = 1.; i < 5.; i++){
      col2 += (vec4(1., 1., 1., 1.) * exp(rand(vec2(downsample(_x, squareSize / i), downsample(_y * ratioY, squareSize / i)), 1.2))) * .1;
  }
  if (col2.a > 1. - (max(0., fade - .2)) * .5){
    col2 = vec4(1., 1., 1., 1.);
  }else{
    col2 = vec4(0., 0., 0., 0.);
  }
  gl_FragColor = v_vColour * col + col2;
}
