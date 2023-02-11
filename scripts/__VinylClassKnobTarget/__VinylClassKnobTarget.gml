/// @param scope
/// @param property

function __VinylClassKnobTarget(_scope, _property) constructor
{
    __scope    = _scope;
    __property = _property;
    
    static __Update = function(_value)
    {
        if (is_instanceof(__scope, __VinylClassLabel))
        {
            if (__property == "gain")
            {
                __scope.__InputGainSet(_value, true);
            }
            else if (__property == "pitch")
            {
                __scope.__InputPitchSet(_value, true);
            }
        }
        else if (is_instanceof(__scope, __VinylClassBasicPattern))
        {
            if (__property == "gain")
            {
                __scope.__gain = _value;
            }
            else if (__property == "pitch")
            {
                __scope.__pitchLo = _value;
                __scope.__pitchHi = _value;
            }
        }
    }
}