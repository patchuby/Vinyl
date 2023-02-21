/// @param vinylID
/// @param behavior

function VinylQueueBehaviorSet(_id, _behavior)
{
    static _globalData = __VinylGlobalData();
    static _idToInstanceDict = _globalData.__idToInstanceDict;
    
    var _instance = _idToInstanceDict[? _id];
    if (is_struct(_instance)) return _instance.__QueueBehaviorSet(_behavior);
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__QueueBehaviorSet(_behavior);
    
    __VinylTrace("Warning! Failed to execute VinylQueueBehaviorSet() for ", _id);
}