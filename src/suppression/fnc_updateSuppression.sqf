#include "script_component.hpp"

params ["_unit"];

private _suppression=0;
private _lastSuppressed=0;

while {alive _unit} do {
	private _current = getSuppression _unit;

	if !(isNil "_current") then {
		if (_current > 0) then {
			_suppression = (_suppression + (GVAR(bulletImpact) * _current)) min 1.0;
			[_unit,_suppression] call FUNC(setSubSkills);

			_lastSuppressed = time;

			LOG_3("Unit: %1, Increased Suppression to: %2 with input unit suppression: %3",_unit,_suppression,_current);
		};

		if (_suppression > 0.0) then {
			if((time - _lastSuppressed) >GVAR(heldTime)) then {
				_suppression = (_suppression - GVAR(decay)) max 0;
				
				[_unit,_current] call FUNC(setSubSkills);

				LOG_2("Unit: %1, decayed suppression to: %2",_unit,_suppression);
			};
		};
	} else {
		WARNING_2("_current suppression is nil, unit %1 which has a type of %2",_unit,typeof _unit);
	};
	
	sleep 0.1;
};

LOG_1("Unit: %1 died",_unit);