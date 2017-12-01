var _seed = random_get_seed();
randomise();
var _result = irandom( 2147483647 );
random_set_seed( _seed );
return _result;