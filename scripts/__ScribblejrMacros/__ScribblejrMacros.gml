// Feather disable all

#macro __SCRIBBLEJR_WRITE  ;\
vertex_float2(__vertexBuffer, _glyphL, _glyphB); vertex_texcoord(__vertexBuffer, _texL, _texB);\
vertex_float2(__vertexBuffer, _glyphR, _glyphB); vertex_texcoord(__vertexBuffer, _texR, _texB);\
vertex_float2(__vertexBuffer, _glyphR, _glyphT); vertex_texcoord(__vertexBuffer, _texR, _texT);\
vertex_float2(__vertexBuffer, _glyphR, _glyphT); vertex_texcoord(__vertexBuffer, _texR, _texT);\
vertex_float2(__vertexBuffer, _glyphL, _glyphT); vertex_texcoord(__vertexBuffer, _texL, _texT);\
vertex_float2(__vertexBuffer, _glyphL, _glyphB); vertex_texcoord(__vertexBuffer, _texL, _texB);

#macro __SCRIBBLEJR_WRITE_EXT  ;\
vertex_float2(__vertexBuffer, _glyphL, _glyphB); vertex_colour(__vertexBuffer, _glyphColour, _glyphAlpha); vertex_texcoord(__vertexBuffer, _texL, _texB);\
vertex_float2(__vertexBuffer, _glyphR, _glyphB); vertex_colour(__vertexBuffer, _glyphColour, _glyphAlpha); vertex_texcoord(__vertexBuffer, _texR, _texB);\
vertex_float2(__vertexBuffer, _glyphR, _glyphT); vertex_colour(__vertexBuffer, _glyphColour, _glyphAlpha); vertex_texcoord(__vertexBuffer, _texR, _texT);\
vertex_float2(__vertexBuffer, _glyphR, _glyphT); vertex_colour(__vertexBuffer, _glyphColour, _glyphAlpha); vertex_texcoord(__vertexBuffer, _texR, _texT);\
vertex_float2(__vertexBuffer, _glyphL, _glyphT); vertex_colour(__vertexBuffer, _glyphColour, _glyphAlpha); vertex_texcoord(__vertexBuffer, _texL, _texT);\
vertex_float2(__vertexBuffer, _glyphL, _glyphB); vertex_colour(__vertexBuffer, _glyphColour, _glyphAlpha); vertex_texcoord(__vertexBuffer, _texL, _texB);