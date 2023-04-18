function __VinylClassEmitter() constructor
{
    static __globalData = __VinylGlobalData();
    
    
    
    __id   = undefined;
    __pool = undefined;
    
    __emitter = audio_emitter_create();
    
    __StateReset();
    
    
    
    static toString = function()
    {
        return "<emitter " + string(__id) + ">";
    }
    
    static __StateReset = function()
    {
        if ((VINYL_DEBUG_LEVEL >= 2) && (__id != undefined)) __VinylTrace("Resetting state for ", self);
        
        __reference = undefined;
        
        __mode = 0; //0 = __Point, 1 = __Circle, 2 = __Rectangle
        
        __actualX = 0;
        __actualY = 0;
        
        __x      = 0;
        __y      = 0;
        __radius = 0;
        
        __left   = 0;
        __top    = 0;
        __right  = 0;
        __bottom = 0;
        
        __pointArray = undefined;
        
        __falloffMin    = VINYL_DEFAULT_FALLOFF_MIN;
        __falloffMax    = VINYL_DEFAULT_FALLOFF_MAX;
        __falloffFactor = VINYL_DEFAULT_FALLOFF_FACTOR;
        
        __voiceIDArray = [];
        
        audio_emitter_position(__emitter, __actualX, __actualY, 0);
        audio_emitter_velocity(__emitter, 0, 0, 0);
        audio_emitter_gain(__emitter, 1);
        audio_emitter_falloff(__emitter, __falloffMin, __falloffMax, __falloffFactor);
        audio_emitter_bus(__emitter, audio_bus_main);
    }
    
    
    
    #region Public
    
    static __FalloffSet = function(_min, _max, _factor = 1)
    {
        _min = max(0, _min);
        _max = max(_min + math_get_epsilon(), _max);
        
        __falloffMin    = _min;
        __falloffMax    = _max;
        __falloffFactor = _factor;
        
        audio_emitter_falloff(__emitter, __falloffMin, __falloffMax, __falloffFactor);
    }
    
    static __PositionSet = function(_x, _y)
    {
        var _dx = _x - __x;
        var _dy = _y - __y;
        
        __x       =  _x;
        __y       =  _y;
        __left   += _dx;
        __top    += _dy;
        __right  += _dx;
        __bottom += _dy;
        
        //Immediately update
        if ((_dx != 0) || (_dy != 0)) __ManagePosition();
    }
    
    static __PositionGet = function()
    {
        static _result = {
            x: undefined,
            y: undefined,
        };
        
        _result.x = __x;
        _result.y = __y;
        
        return _result;
    }
    
    static __Point = function(_x, _y)
    {
        __mode = 0;
        
        __x      = _x;
        __y      = _y;
        __radius = 0.5*VINYL_LISTENER_HEAD_SIZE;
        
        __left   = _x - __radius;
        __top    = _y - __radius;
        __right  = _x + __radius;
        __bottom = _y + __radius;
        
        __pointArray = undefined;
        
        __ManagePosition();
    }
    
    static __Circle = function(_x, _y, _radius)
    {
        __mode = 1;
        
        __x      = _x;
        __y      = _y;
        __radius = _radius + 0.5*VINYL_LISTENER_HEAD_SIZE;
        
        __left   = _x - _radius;
        __top    = _y - _radius;
        __right  = _x + _radius;
        __bottom = _y + _radius;
        
        __pointArray = undefined;
        
        __ManagePosition();
    }
    
    static __Rectangle = function(_left, _top, _right, _bottom)
    {
        __mode = 2;
        
        __left   = -0.5*VINYL_LISTENER_HEAD_SIZE + _left;
        __top    = -0.5*VINYL_LISTENER_HEAD_SIZE + _top;
        __right  =  0.5*VINYL_LISTENER_HEAD_SIZE + _right;
        __bottom =  0.5*VINYL_LISTENER_HEAD_SIZE + _bottom;
        
        __pointArray = undefined;
        
        __x      = 0.5*(__left + __right);
        __y      = 0.5*(__top + __bottom);
        __radius = 0;
        
        __ManagePosition();
    }
    
    static __Polyline = function(_radius, _pointArray)
    {
        __mode = 3;
        
        var _length = array_length(_pointArray);
        if ((_length mod 2) != 0) __VinylError("Polyline-type emitters should have an even number of elements, structured as coordinate pairs (length=", _length, ")");
        if (_length < 4) __VinylError("Polyline-type emitters should have at least 2 coordinate pairs (length=", _length, ")");
        
        __radius     = _radius + 0.5*VINYL_LISTENER_HEAD_SIZE;
        __pointArray = _pointArray;
        
        __BuildBoundsFromPointArray();
        
        __ManagePosition();
    }
    
    static __Polygon = function(_radius, _pointArray)
    {
        __mode = 4;
        
        var _length = array_length(_pointArray);
        if ((_length mod 2) != 0) __VinylError("Polygon-type emitters should have an even number of elements, structured as coordinate pairs (length=", _length, ")");
        if (_length < 6) __VinylError("Polygon-type emitters should have at least 3 coordinate pairs (length=", _length, ")");
        
        //Ensure the polygon is closed
        if ((_pointArray[0] != _pointArray[_length-2]) || (_pointArray[1] != _pointArray[_length-1]))
        {
            array_push(_pointArray, _pointArray[0], _pointArray[1]);
        }
        
        __radius     = _radius + 0.5*VINYL_LISTENER_HEAD_SIZE;
        __pointArray = _pointArray;
        
        __BuildBoundsFromPointArray();
        
        __ManagePosition();
    }
    
    static __BuildBoundsFromPointArray = function()
    {
        __left   =  infinity;
        __top    =  infinity;
        __right  = -infinity;
        __bottom = -infinity;
        
        var _i = 0;
        repeat(array_length(__pointArray) div 2)
        {
            var _x = __pointArray[_i  ];
            var _y = __pointArray[_i+1];
            
            __left   = min(_x, __left  );
            __top    = min(_y, __top   );
            __right  = max(_x, __right );
            __bottom = max(_y, __bottom);
            
            _i += 2;
        }
        
        __x = 0.5*(__left + __right);
        __y = 0.5*(__top + __bottom);
    }
    
    static __DebugDraw = function()
    {
        draw_line(__x-7, __y-7, __x+7, __y+7);
        draw_line(__x+7, __y-7, __x-7, __y+7);
        draw_rectangle(__actualX-3, __actualY-3, __actualX+3, __actualY+3, true);
        
        if (__mode == 1) //Circle
        {
            draw_circle(__x, __y, __radius, true);
        }
        else if (__mode == 2) //Rectangle
        {
            draw_rectangle(__left, __top, __right, __bottom, true);
        }
        else if ((__mode == 3) || (__mode == 4)) //Polyline or Polygon
        {
            draw_primitive_begin(pr_linestrip);
            
            var _i = 0;
            repeat(array_length(__pointArray) div 2)
            {
                draw_vertex(__pointArray[_i], __pointArray[_i+1]);
                _i += 2;
            }
            
            draw_primitive_end();
            
            if (__radius > 0) draw_circle(__actualX, __actualY, __radius, true);
        }
        
        draw_circle(__actualX, __actualY, __falloffMin, true);
        draw_circle(__actualX, __actualY, __falloffMax, true);
    }
    
    #endregion
    
    
    
    #region Private
    
    static __VoiceAdd = function(_id)
    {
        array_push(__voiceIDArray, __id);
    }
    
    static __VoiceRemove = function(_id)
    {
        static _closure = {
            __value: undefined,
        };
        
        static _function = method(_closure, function(_value)
        {
            return (__value != _value);
        });
        
        _closure.__value = _id;
        array_resize(__voiceIDArray, array_filter_ext(__voiceIDArray, _function));
    }
    
    static __ManagePosition = function()
    {
        if (__mode == 0) //Point
        {
            __actualX = __x;
            __actualY = __y;
        }
        else if (__mode == 1) //Circle
        {
            __ManageFromCircle(__x, __y);
        }
        else if (__mode == 2) //Rectangle
        {
            __actualX = clamp(__globalData.__listenerX, __left, __right );
            __actualY = clamp(__globalData.__listenerY, __top,  __bottom);
        }
        else if (__mode == 3) //Polyline
        {
            __ManageFromEdges();
        }
        else if (__mode == 4) //Polygon
        {
            var _px = __globalData.__listenerX;
            var _py = __globalData.__listenerY;
            
            var _pointArray = __pointArray;
            
            var _x0 = undefined;
            var _y0 = undefined;
            var _x1 = _pointArray[0];
            var _y1 = _pointArray[1];
            
            var _inside = false;
            
            //Find the closest line to the point
            var _i = 2;
            repeat((array_length(_pointArray) div 2)-1)
            {
                _x0 = _x1;
                _y0 = _y1;
                _x1 = _pointArray[_i  ];
                _y1 = _pointArray[_i+1];
                
                if ((_y1 > _py) != (_y0 > _py))
                {
                    _inside ^= (_px < _x1 + ((_x0 - _x1)*(_py - _y1) / (_y0 - _y1)));
                }
                
                _i += 2;
            }
            
            if (_inside)
            {
                //If the listener is inside the polygon, set our emitter position to the listener
                __actualX = _px;
                __actualY = _py;
            }
            else
            {
                //Otherwise find the nearest edge
                __ManageFromEdges();
            }
        }
        
        audio_emitter_position(__emitter, __actualX, __actualY, 0);
    }
    
    static __ManageFromEdges = function()
    {
        var _px = __globalData.__listenerX;
        var _py = __globalData.__listenerY;
        
        var _pointArray = __pointArray;
        
        var _x0 = undefined;
        var _y0 = undefined;
        var _x1 = _pointArray[0];
        var _y1 = _pointArray[1];
        
        var _minDist = infinity;
        var _minI    = undefined;
        
        //Find the closest line to the point
        var _i = 0;
        repeat((array_length(_pointArray) div 2)-1)
        {
            _x0 = _x1;
            _y0 = _y1;
            _x1 = _pointArray[_i+2];
            _y1 = _pointArray[_i+3];
             
            var _distance = __DistanceToEdge(_px, _py, _x0, _y0, _x1, _y1);
            if (_distance < _minDist)
            {
                _minDist = _distance;
                _minI    = _i;
            }
            
            _i += 2;
        }
        
        if (_minI != undefined)
        {
            //Get the point on the line closest to the listener
            var _point = __ClosestPointOnEdge(_px, _py, _pointArray[_minI], _pointArray[_minI+1], _pointArray[_minI+2], _pointArray[_minI+3]);
            
            //We then use the same maths as the Circle emitter to create a circular area around the polyline
            __ManageFromCircle(_point.x, _point.y);
        }
    }
    
    static __ManageFromCircle = function(_circleX, _circleY)
    {
        var _dX = __globalData.__listenerX - _circleX;
        var _dY = __globalData.__listenerY - _circleY;
        
        var _length = sqrt(_dX*_dX + _dY*_dY);
        if (_length > __radius)
        {
            var _factor = __radius/_length;
            __actualX = _factor*_dX + _circleX;
            __actualY = _factor*_dY + _circleY;
        }
        else
        {
            __actualX = __globalData.__listenerX;
            __actualY = __globalData.__listenerY;
        }
    }
    
    static __DistanceToEdge = function(_px, _py, _x0, _y0, _x1, _y1)
    {
        var _dx = _x1 - _x0;
        var _dy = _y1 - _y0;
        var _lengthSqr = _dx*_dx + _dy*_dy;
        
        //Edge case where the line has length 0
        if (_lengthSqr <= 0) return point_distance(_px, _py, _x0, _y0);
        
        var _t = clamp((_dx*(_px - _x0) + (_py - _y0)*_dy) / _lengthSqr, 0, 1);
        return point_distance(_px, _py, _x0 + _t*_dx, _y0 + _t*_dy);
    }
    
    static __ClosestPointOnEdge = function(_px, _py, _x0, _y0, _x1, _y1)
    {
        static _result = {
            x: undefined,
            y: undefined,
        }
        
        var _dx = _x1 - _x0;
        var _dy = _y1 - _y0;
        var _lengthSqr = _dx*_dx + _dy*_dy;
        
        //Edge case where the line has length 0
        if (_lengthSqr <= 0)
        {
            _result.x = _x0;
            _result.y = _y0;
        }
        else
        {
            var _t = clamp((_dx*(_px - _x0) + (_py - _y0)*_dy) / _lengthSqr, 0, 1);
            _result.x = _x0 + _t*_dx;
            _result.y = _y0 + _t*_dy;
        }
        
        return _result;
    }
    
    static __DepoolCallback = function()
    {
        
    }
    
    static __PoolCallback = function()
    {
        //Stop all voices playing on this emitter
        var _i = 0;
        repeat(array_length(__voiceIDArray))
        {
            VinylStop(__voiceIDArray[_i]);
            ++_i;
        }
        
        __StateReset();
    }
    
    static __Tick = function()
    {
        if (__reference == undefined)
        {
            //Somehow we've lost our reference, let's return to the pool
            if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace("Reference for ", self, " is <undefined>");
            __VINYL_RETURN_SELF_TO_POOL
        }
        else if (!weak_ref_alive(__reference))
        {
            if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace("Lost reference for ", self);
            __VINYL_RETURN_SELF_TO_POOL
        }
    }
    
    #endregion
}