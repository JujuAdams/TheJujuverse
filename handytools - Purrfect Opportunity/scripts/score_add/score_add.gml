/// @param player
/// @param score

var _player = argument0;
var _score  = argument1;

if ( _score > 0 ) {
	var _object = obj_score_up;
	var _text = "+" + string( _score );
} else {
	var _object = obj_score_down;
	var _text = string( _score );
}

if ( _player == 0 ) {
	var _inst = instance_create_layer( obj_score_a.x, obj_score_a.y - 60, "Instances", _object );
	_inst.text = _text;
	global.gameflow_score_a += _score;
} else {
	var _inst = instance_create_layer( obj_score_b.x, obj_score_b.y - 60, "Instances", _object );
	_inst.text = _text;
	global.gameflow_score_b += _score;
}