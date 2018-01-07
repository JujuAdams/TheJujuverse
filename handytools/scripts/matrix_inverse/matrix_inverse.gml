/// @desc Returns the inverse of a 4x4 matrix
/// @param matrix

var _matrix = argument0;
var _inv;

_inv[0] = _matrix[5]  * _matrix[10] * _matrix[15] - 
         _matrix[5]  * _matrix[11] * _matrix[14] - 
         _matrix[9]  * _matrix[6]  * _matrix[15] + 
         _matrix[9]  * _matrix[7]  * _matrix[14] +
         _matrix[13] * _matrix[6]  * _matrix[11] - 
         _matrix[13] * _matrix[7]  * _matrix[10];

_inv[4] = -_matrix[4]  * _matrix[10] * _matrix[15] + 
          _matrix[4]  * _matrix[11] * _matrix[14] + 
          _matrix[8]  * _matrix[6]  * _matrix[15] - 
          _matrix[8]  * _matrix[7]  * _matrix[14] - 
          _matrix[12] * _matrix[6]  * _matrix[11] + 
          _matrix[12] * _matrix[7]  * _matrix[10];

_inv[8] = _matrix[4]  * _matrix[9] * _matrix[15] - 
         _matrix[4]  * _matrix[11] * _matrix[13] - 
         _matrix[8]  * _matrix[5] * _matrix[15] + 
         _matrix[8]  * _matrix[7] * _matrix[13] + 
         _matrix[12] * _matrix[5] * _matrix[11] - 
         _matrix[12] * _matrix[7] * _matrix[9];

_inv[12] = -_matrix[4]  * _matrix[9] * _matrix[14] + 
           _matrix[4]  * _matrix[10] * _matrix[13] +
           _matrix[8]  * _matrix[5] * _matrix[14] - 
           _matrix[8]  * _matrix[6] * _matrix[13] - 
           _matrix[12] * _matrix[5] * _matrix[10] + 
           _matrix[12] * _matrix[6] * _matrix[9];

_inv[1] = -_matrix[1]  * _matrix[10] * _matrix[15] + 
          _matrix[1]  * _matrix[11] * _matrix[14] + 
          _matrix[9]  * _matrix[2] * _matrix[15] - 
          _matrix[9]  * _matrix[3] * _matrix[14] - 
          _matrix[13] * _matrix[2] * _matrix[11] + 
          _matrix[13] * _matrix[3] * _matrix[10];

_inv[5] = _matrix[0]  * _matrix[10] * _matrix[15] - 
         _matrix[0]  * _matrix[11] * _matrix[14] - 
         _matrix[8]  * _matrix[2] * _matrix[15] + 
         _matrix[8]  * _matrix[3] * _matrix[14] + 
         _matrix[12] * _matrix[2] * _matrix[11] - 
         _matrix[12] * _matrix[3] * _matrix[10];

_inv[9] = -_matrix[0]  * _matrix[9] * _matrix[15] + 
          _matrix[0]  * _matrix[11] * _matrix[13] + 
          _matrix[8]  * _matrix[1] * _matrix[15] - 
          _matrix[8]  * _matrix[3] * _matrix[13] - 
          _matrix[12] * _matrix[1] * _matrix[11] + 
          _matrix[12] * _matrix[3] * _matrix[9];

_inv[13] = _matrix[0]  * _matrix[9] * _matrix[14] - 
          _matrix[0]  * _matrix[10] * _matrix[13] - 
          _matrix[8]  * _matrix[1] * _matrix[14] + 
          _matrix[8]  * _matrix[2] * _matrix[13] + 
          _matrix[12] * _matrix[1] * _matrix[10] - 
          _matrix[12] * _matrix[2] * _matrix[9];

_inv[2] = _matrix[1]  * _matrix[6] * _matrix[15] - 
         _matrix[1]  * _matrix[7] * _matrix[14] - 
         _matrix[5]  * _matrix[2] * _matrix[15] + 
         _matrix[5]  * _matrix[3] * _matrix[14] + 
         _matrix[13] * _matrix[2] * _matrix[7] - 
         _matrix[13] * _matrix[3] * _matrix[6];

_inv[6] = -_matrix[0]  * _matrix[6] * _matrix[15] + 
          _matrix[0]  * _matrix[7] * _matrix[14] + 
          _matrix[4]  * _matrix[2] * _matrix[15] - 
          _matrix[4]  * _matrix[3] * _matrix[14] - 
          _matrix[12] * _matrix[2] * _matrix[7] + 
          _matrix[12] * _matrix[3] * _matrix[6];

_inv[10] = _matrix[0]  * _matrix[5] * _matrix[15] - 
          _matrix[0]  * _matrix[7] * _matrix[13] - 
          _matrix[4]  * _matrix[1] * _matrix[15] + 
          _matrix[4]  * _matrix[3] * _matrix[13] + 
          _matrix[12] * _matrix[1] * _matrix[7] - 
          _matrix[12] * _matrix[3] * _matrix[5];

_inv[14] = -_matrix[0]  * _matrix[5] * _matrix[14] + 
           _matrix[0]  * _matrix[6] * _matrix[13] + 
           _matrix[4]  * _matrix[1] * _matrix[14] - 
           _matrix[4]  * _matrix[2] * _matrix[13] - 
           _matrix[12] * _matrix[1] * _matrix[6] + 
           _matrix[12] * _matrix[2] * _matrix[5];

_inv[3] = -_matrix[1] * _matrix[6] * _matrix[11] + 
          _matrix[1] * _matrix[7] * _matrix[10] + 
          _matrix[5] * _matrix[2] * _matrix[11] - 
          _matrix[5] * _matrix[3] * _matrix[10] - 
          _matrix[9] * _matrix[2] * _matrix[7] + 
          _matrix[9] * _matrix[3] * _matrix[6];

_inv[7] = _matrix[0] * _matrix[6] * _matrix[11] - 
         _matrix[0] * _matrix[7] * _matrix[10] - 
         _matrix[4] * _matrix[2] * _matrix[11] + 
         _matrix[4] * _matrix[3] * _matrix[10] + 
         _matrix[8] * _matrix[2] * _matrix[7] - 
         _matrix[8] * _matrix[3] * _matrix[6];

_inv[11] = -_matrix[0] * _matrix[5] * _matrix[11] + 
           _matrix[0] * _matrix[7] * _matrix[9] + 
           _matrix[4] * _matrix[1] * _matrix[11] - 
           _matrix[4] * _matrix[3] * _matrix[9] - 
           _matrix[8] * _matrix[1] * _matrix[7] + 
           _matrix[8] * _matrix[3] * _matrix[5];

_inv[15] = _matrix[0] * _matrix[5] * _matrix[10] - 
          _matrix[0] * _matrix[6] * _matrix[9] - 
          _matrix[4] * _matrix[1] * _matrix[10] + 
          _matrix[4] * _matrix[2] * _matrix[9] + 
          _matrix[8] * _matrix[1] * _matrix[6] - 
          _matrix[8] * _matrix[2] * _matrix[5];

var _det = _matrix[0] * _inv[0] + _matrix[1] * _inv[4] + _matrix[2] * _inv[8] + _matrix[3] * _inv[12];

if ( _det == 0 ) {
    trace_error( false, "The determinant is zero" );
    return _matrix;
}

_det = 1 / _det;
for( var i = 0; i < 16; i++ ) _inv[i] *= _det;
return _inv;

