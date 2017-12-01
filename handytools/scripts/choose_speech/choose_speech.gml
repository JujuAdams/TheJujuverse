///choose_speech( length )

var _length = argument0;

//0 = medium
//1 = short
//2 = long
//3 = short
//4 = very short
//5 = short
//6 = medium
//7 = long

if ( _length <= 4 ) {
    return choose( snd_voice_1, snd_voice_3, snd_voice_4 );
} else if ( _length <= 7 ) {
    return choose( snd_voice_0, snd_voice_6 );
} else {
    return choose( snd_voice_2, snd_voice_7 );
}