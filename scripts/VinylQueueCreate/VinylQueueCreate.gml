// Feather disable all

/// Create a new sound queue. A sound queue is used to play audio in a particular sequence which is
/// useful to set up dynamic soundtracks, in-game radio stations etc.  This function returns a
/// queue index which can be used like the voice index returned by VinylPlay(). This means you can
/// call VinylFadeOut(), VinylPause(), VinylSetGain() etc. targeting a queue and the queue will
/// behave appropriately.
/// 
/// There are three behaviours that a sound queue can use, found in VINYL_QUEUE enum.
/// 
///   - .DONT_LOOP will play each sound in the queue once
///   - .LOOP_ON_LAST will play each sound in the queue once until the last sound, which is looped
///   - .LOOP_EACH will loop each sound
/// 
/// The currently playing sound can be manually set to loop or not loop by calling VinylSetLoop()
/// targeting the queue. If a sound is not looping and completes playing then the next sound in the
/// queue will be played.
/// 
/// The queue itself can be set to loop as well. Internally this is achieved by pushing stopping
/// sounds to the bottom of the queue.
/// 
/// @param behaviour
/// @param loopQueue
/// @param [gain=1]
/// @param [emitter]

function VinylQueueCreate(_behaviour, _loopQueue, _gain = 1, _emitter = undefined)
{
    return (new __VinylClassVoiceQueue(undefined, _behaviour, _loopQueue, _gain, _emitter)).__voiceReference;
}