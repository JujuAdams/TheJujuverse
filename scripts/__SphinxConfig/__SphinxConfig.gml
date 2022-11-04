//Maximum number of bytes to XOR
//Generally this should be set to <infinity> to best protect data, but it *can* be set to a lower value for the sake of performance
//Smaller values increase the risk of the encryption being broken
#macro  SPHINX_MAXIMUM_XOR_BYTES  infinity