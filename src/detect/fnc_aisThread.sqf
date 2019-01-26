#include "script_component.hpp"

params ["_ai"];

while {true} do{

	private _startTime = diag_tickTime;
	{
		if ((!isPlayer _x) && alive _x) then {
			private _ai = _x;
			private _vision = [_ai] call FUNC(aiVision);
			_ai setVariable ["CF_BAI_DETECT_VISION",_vision];

			//LOG_2("set AI %1 to vision: %2",_ai, _vision);
		};
		sleep 0.02;
	} forEach allUnits;
	private _endTime = diag_tickTime;
	
	private _sleepTime = 10 - (_endTime-_startTime);
	if (_sleepTime > 0) then {
		sleep _sleepTime;
	} else {
		WARNING_1("Runtime AIs:%1",_endTime-_startTime);
	};
};