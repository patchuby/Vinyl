/// @param vinylID

function VinylStop(_id)
{
	var _instance = global.__vinylInstanceIDs[? _id];
	if (_instance == undefined) return;
    return _instance.__Stop();
}