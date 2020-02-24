#include "script_component.hpp"

params ["_visionTests","_timeInSeconds"];

private _probability = 1.0;
{
	private _testProb = _x select 0;
	_probability = _probability * _testProb;
} forEach _visionTests;

private _originalProbability = _probability;
//adjust probability with global modifier
if (GVAR(overall_visibility_multiplier) > 1.0) then {
	_probability = _probability + ((1.0 - _probability) * (1.0 - GVAR(overall_visibility_multiplier)));
} else {
	_probability = _probability * GVAR(overall_visibility_multiplier);
};


//Do a test for every second
//Compensates for running the visionTests less often without impacting probability as if tests were every second.
private _finalProbability = 1.0 - ((1.0- _probability) ^ _timeInSeconds);
private _didSee = (random 1) < _finalProbability;

if (_didSee) then {
	private _knowsAbout = 1.0;
	{
		private _testKnows = _x select 1;
		_knowsAbout = _knowsAbout * _testKnows;
	} forEach _visionTests;
	_knowsAbout * 4.0; //knowsAbout range is 0.0 - 4.0 but the value input is 0.0-1.0
} else {
	0.0;
};