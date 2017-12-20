///load_room_n( n )

var _n = argument0;
switch( _n ) {
    case 0: //Dark room
        global.game_text = "";
        global.game_phone_do_ring = true;
    break;
    case 1: //Hallway
        global.game_text = "This first room tutorialises\nthe basic gameflow.\n\nIn the original game, these phones acted as narrative delivery and drove the storyline.";
        global.game_phone_do_ring = true;
    break;
    case 2: //Spirals
        global.game_text = "The early rooms were largely designed\nto give the player a sense of psychosis.";
        global.game_phone_do_ring = true;
    break;
    case 3: //Phones
        global.game_text = "This room is based on Juju's own anxieties.\nHe hates phonecalls!";
        global.game_phone_do_ring = true;
    break;
    case 4: //Mirrors
        global.game_text = concat( "The ", QU, "mirrors", QU, " are constructed using separate render passes." );
        global.game_phone_do_ring = true;
    break;
    case 5: //Scissors
        global.game_text = "Scissors are a domestic but aggressive\nsymbol. A lot of self-harm is performed\nusing scissors.";
        global.game_phone_do_ring = true;
    break;
    case 6: //Upside-Down
        global.game_text = "The shaders and audio were made by Jan -\nhe's a great technical artist.\nThe models were made by Chris and Daniel.";
        global.game_phone_do_ring = true;
    break;
    case 7: //Hammer
        global.game_text = concat( "This room was described as\n", QU, "depression as an art installation", QU, ".\nThis wasn't fully intended but it's good to hear people thought about what we made." );
        global.game_phone_do_ring = true;
    break;
    case 8: //Flowers
        global.game_text = "The flowers here can symbolise both life\nand death depending on your viewpoint.\n\nA lot of life depends on your perspective.";
        global.game_phone_do_ring = true;
    break;
    case 9: //Broken phone
        global.game_text = "Most players ended up with this ending, choosing flowers that go from alive to dead.\n\nSubconscious or deliberate, this was an interesting outcome.";
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
global.mirror_count = 0;
room_decode( _str );

if ( global.game_room == 0 ) with( obj_door_spawn ) door_spawn_time = current_time + 800;

return true;