/// @param container

var _container = argument0;

var _animation_finished = false;

var _array      = dotobj_animation_containers[? _container ];
var _frames     = dotobj_animation_frames( _array );
var _name       = _array[ DOTOBJ_ANIMATION_METADATA.NAME       ];
var _time       = _array[ DOTOBJ_ANIMATION_METADATA.TIME       ];
var _index      = _array[ DOTOBJ_ANIMATION_METADATA.INDEX      ];
var _transition = _array[ DOTOBJ_ANIMATION_METADATA.TRANSITION ];

while( true ) {
	
	var _duration = _array[ DOTOBJ_ANIMATION_METADATA.SIZE + _index*2 + 1 ];
	
	var _passed = time_has_passed( _time, _duration );
	if ( _passed ) {
		
		_array[@ DOTOBJ_ANIMATION_METADATA.TIME ] += _duration;
		_time += _duration;
		
		_index++;
		if ( _index >= _frames ) {
			
			_animation_finished = true;
			
			if ( _transition == _name ) {
				
				_index = _index mod _frames;
				
			} else {
				
				dotobj_animation_play( _container, _transition );
                
				_array  = dotobj_animation_containers[? _container ];
				_frames = dotobj_animation_frames( _array );
				_array[@ DOTOBJ_ANIMATION_METADATA.TIME ] = _time;
				
				_name   = _transition;
				_index  = 0;
				
			}
			
		}
		
		_array[@ DOTOBJ_ANIMATION_METADATA.INDEX ] = _index;
		
	} else {
		
		break;
		
	}
	
}

return _animation_finished;