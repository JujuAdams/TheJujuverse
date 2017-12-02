///load_room_n( n )

var _n = argument0;
switch( _n ) {
    case 0: //Dark room
        global.game_text = "";
        global.game_phone_do_ring = true;
    break;
    case 1: //Hallway
        global.game_text = "Hey there day-dreamer.\nYou seem miles away.";
        global.game_phone_do_ring = true;
    break;
    case 2: //Spirals
        global.game_text = "Are you okay, sweetheart?\nWhat're you staring at on the floor?";
        global.game_phone_do_ring = true;
    break;
    case 3: //Phones
        global.game_text = "What are those mumblings I've been hearing from your room at night?";
        global.game_phone_do_ring = true;
    break;
    case 4: //Mirrors
        global.game_text = "Stop talking to yourself.\nIt's embarrassing me.";
        global.game_phone_do_ring = true;
    break;
    case 5: //Scissors
        global.game_text = "They're all trying to help you.\nJust try. Please.";
        global.game_phone_do_ring = true;
    break;
    case 6: //Upside-Down
        global.game_text = "You can't come back yet... The doctors said you'd only get worse. I'm sorry.";
        global.game_phone_do_ring = true;
    break;
    case 7: //Hammer
        global.game_text = "Why do you keep talking to me like this?\nStop calling me.";
        global.game_phone_do_ring = true;
    break;
    case 8: //Flowers
        global.game_text = "The hospital called me last week.\nPlease eat your meals.";
        global.game_phone_do_ring = true;
    break;
    case 9: //Broken phone
        global.game_text = "I just wish this would be over with.\nYou've broken my heart.";
        global.game_phone_do_ring = true;
    break;
    case 10: //Ending
        global.game_text = "";
        global.game_phone_do_ring = false;
        global.game_outro_do = true;
        global.game_outro_last_event = current_time;
    break;
    case 11: //Alternate Ending
        global.game_text = "";
        global.game_phone_do_ring = false;
        global.game_outro_do = true;
        global.game_outro_last_event = current_time;
    break;
}

var _str = file_open_string( "rooms/room " + string( global.game_room ) + ".json" );
if ( _str == undefined ) return false;
room_decode( _str );

if ( global.game_room == 0 ) with( obj_door_spawn ) door_spawn_time = current_time + 800;

return true;