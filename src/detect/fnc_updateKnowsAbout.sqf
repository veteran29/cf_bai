#include "script_component.hpp"

params ["_ai","_player","_timeInSeconds"];

private _visionTests = [_ai,_player] call FUNC(getVisionTests);

private _knowsAbout = [_visionTests,_timeInSeconds] call FUNC(determineKnowsAbout);

if (_knowsAbout > 0.0) then {
	LOG_4("%1 gained knowledge about player %2, vision: %3, KnowsAbout: %4",_ai,_player,_visionTests,_knowsAbout);

	private _currentKnowledge = _ai knowsAbout _player;
	_ai reveal [_player,_currentKnowledge + _knowsAbout];

	_ai lookAt (position _player);
};