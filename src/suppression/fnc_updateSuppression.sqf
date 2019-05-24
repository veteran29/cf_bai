#include "script_component.hpp"

params ["_unit"];

private _suppression=0;
private _lastSuppressed=0;
private _current =0;
private _prior=0;

while {alive _unit} do {
	_current = getSuppression _unit;
	if (isNil "_current") then {
		_current =0;
	};
	
	if (_current > 0 && {_current>_prior}) then {
		_suppression = (_suppression + GVAR(bulletImpact)) min 1.0;
		[_unit,_suppression] call FUNC(setSubSkills);

		_lastSuppressed = time;

		LOG_3("Unit: %1, Increased Suppression to: %2 with input unit suppression: %3",_unit,_suppression,_current);
	};

	if (_suppression > 0.0) then {
		if((time - _lastSuppressed) >GVAR(heldTime)) then {
			_suppression = (_suppression - GVAR(decay)) max 0;
			
			[_unit,_suppression] call FUNC(setSubSkills);

			LOG_2("Unit: %1, decayed suppression to: %2",_unit,_suppression);
		};
	};
	_prior = _current;
	sleep 0.1;
};

LOG_1("Unit: %1 died",_unit);