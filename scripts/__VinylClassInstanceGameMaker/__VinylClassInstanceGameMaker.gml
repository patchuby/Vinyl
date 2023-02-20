function __VinylClassInstanceGameMaker() constructor
{
    static __patternType = "gm";
    
    
    
    static toString = function()
    {
        if (__sound == undefined)
        {
            return "<gm " + string(__instance) + ">";
        }
        else
        {
            return "<gm " + string(__instance) + " " + string(audio_get_name(__sound)) + ">";
        }
    }
    
    
    
    static __Play = function(_emitter, _sound, _loop, _gain, _pitch)
    {
        __sound = _sound;
        
        if (_emitter == undefined)
        {
            __instance = audio_play_sound(_sound, 1, _loop, __VinylCurveAmplitude(_gain), 0, _gain);
            
            if (VINYL_DEBUG_LEVEL >= 1)
            {
                __VinylTrace("Playing ", self, ", loop=", _loop? "true" : "false", ", gain=", _gain, ", pitch=", _gain, " (amplitude=", _gain/VINYL_MAX_GAIN, ")");
            }
        }
        else
        {
            __instance = audio_play_sound_on(_emitter, _sound, _loop, 1, __VinylCurveAmplitude(_gain), 0, _gain);
            
            if (VINYL_DEBUG_LEVEL >= 1)
            {
                __VinylTrace("Playing ", self, " on emitter ", _emitter, ", loop=", _loop? "true" : "false", ", gain=", _gain, ", pitch=", _gain, " (amplitude=", _gain/VINYL_MAX_GAIN, ")");
            }
        }
        
        __LoopPointsSet();
        
        if (_gain > VINYL_MAX_GAIN)
        {
            __VinylTrace("Warning! Gain value ", _gain, " exceeds VINYL_MAX_GAIN (", VINYL_MAX_GAIN, ")");
        }
    }
    
    
    
    #region Gain
    
    static __GainSet = function(_gain)
    {
        if ((VINYL_DEBUG_LEVEL >= 2) && (audio_sound_get_gain(__instance) != _gain)) __VinylTrace(self, " gain=", audio_sound_get_gain(__instance), " -> ", _gain);
        
        audio_sound_gain(__instance, __VinylCurveAmplitude(_gain), VINYL_STEP_DURATION);
    }
    
    static __GainGet = function()
    {
        return audio_sound_get_gain(__instance);
    }
    
    static __GainTargetSet = function()
    {
        //Do nothing
    }
    
    static __GainTargetGet = function()
    {
        //Do nothing
    }
    
    static __GainOutputGet = function()
    {
        return audio_sound_get_gain(__instance);
    }
    
    #endregion
    
    
    
    #region Pitch
    
    static __PitchSet = function(_pitch)
    {
        if ((VINYL_DEBUG_LEVEL >= 2) && (audio_sound_get_pitch(__instance) != _pitch)) __VinylTrace(self, " pitch=", audio_sound_get_pitch(__instance), " -> ", _pitch);
        
        audio_sound_pitch(__instance, _pitch);
    }
    
    static __PitchGet = function()
    {
        return audio_sound_get_pitch(__instance);
    }
    
    static __PitchTargetSet = function()
    {
        //Do nothing
    }
    
    static __PitchTargetGet = function()
    {
        //Do nothing
    }
    
    static __PitchOutputGet = function()
    {
        return audio_sound_get_pitch(__instance);
    }
    
    #endregion
    
    
    
    #region Transpose
    
    static __TransposeSet = function(_pitch)
    {
        //Do nothing
    }
    
    static __TransposeReset = function()
    {
        //Do nothing
    }
    
    static __TransposeGet = function()
    {
        //Do nothing
    }
    
    #endregion
    
    
    
    #region Loop
    
    static __LoopSet = function(_state)
    {
        audio_sound_loop(__instance, _state);
    }
    
    static __LoopPointsSet = function()
    {
        var _loopPoints = __VinylPatternGet(__sound).__loopPoints;
        if (is_array(_loopPoints))
        {
            audio_sound_loop_start(__instance, _loopPoints[0]);
            audio_sound_loop_end(  __instance, _loopPoints[1]);
        }
        else
        {
            audio_sound_loop_start(__instance, 0);
            audio_sound_loop_end(  __instance, audio_sound_length(__instance));
        }
    }
    
    #endregion
    
    
    
    #region Playback
    
    static __IsPlaying = function()
    {
        if (!is_numeric(__instance)) return false;
        
        return audio_is_playing(__instance);
    }
    
    static __Pause = function()
    {
        if (!is_numeric(__instance)) return;
        if (audio_is_paused(__instance)) return;
        
        if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace("Pausing ", self);
        
        audio_pause_sound(__instance);
    }
    
    static __Resume = function()
    {
        if (!is_numeric(__instance)) return;
        if (!audio_is_paused(__instance)) return;
        
        if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace("Resuming ", self);
        
        audio_resume_sound(__instance);
    }
    
    static __FadeOut = function(_rate)
    {
        if (!is_numeric(__instance)) return;
        
        __VinylTrace("Warning! Cannot fade out ", self, " as it is a native GameMaker instance. Stopping instead");
        
        __Stop();
    }
    
    static __Stop = function()
    {
        if (!is_numeric(__instance)) return;
        
        if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace("Stopping ", self);
        
        audio_stop_sound(__instance);
        
        __sound    = undefined;
        __instance = undefined;
    }
    
    #endregion
    
    
    
    #region Queue
    
    static __QueuePush = function(_asset)
    {
        __VinylError("Cannot use VinylQueuePush() on a native GameMaker instance");
    }
    
    static __QueueBehaviorSet = function(_behavior)
    {
        __VinylError("Cannot use VinylQueueBehaviorSet() on a native GameMaker instance");
    }
    
    static __QueueBehaviorGet = function()
    {
        __VinylError("Cannot use VinylQueueBehaviorGet() on a native GameMaker instance");
    }
    
    #endregion
    
    
    
    #region Multi
    
    static __MultiChannelCountGet = function(_asset)
    {
        __VinylError("Cannot use VinylMultiChannelCountGet() on a native GameMaker instance");
    }
    
    static __MultiGainSet = function(_index, _gain)
    {
        __VinylError("Cannot use VinylMultiGainSet() on a native GameMaker instance");
    }
    
    static __MultiGainGet = function(_index)
    {
        __VinylError("Cannot use VinylMultiGainGet() on a native GameMaker instance");
    }
    
    static __MultiBlendSet = function(_blendFactor)
    {
        __VinylError("Cannot use VinylMultiBlendSet() on a native GameMaker instance");
    }
    
    static __MultiBlendGet = function()
    {
        __VinylError("Cannot use VinylMultiBlendGet() on a native GameMaker instance");
    }
    
    static __MultiSyncSet = function(_state)
    {
        __VinylError("Cannot use VinylMultiSyncSet() on a native GameMaker instance");
    }
    
    static __MultiSyncGet = function()
    {
        __VinylError("Cannot use VinylMultiSyncGet() on a native GameMaker instance");
    }
    
    #endregion
}