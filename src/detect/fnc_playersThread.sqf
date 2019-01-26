#include "script_component.hpp"

while {true} do{
	
	private _startTime = diag_tickTime;
	{
		if (alive _x) then {
			private _player = _x;
			private _visibility = [_player] call FUNC(playerVisibility);
			_player setVariable ["CF_BAI_DETECT_VISIBILITY",_visibility];

			//LOG_2("set Player %1 to visibility: %2",_player, _visibility);
		};
		sleep 0.02;
	} forEach allPlayers - entities "HeadlessClient_F";

	private _endTime = diag_tickTime;

	private _sleepTime = 10 - (_endTime-_startTime);
	if (_sleepTime > 0) then {
		sleep _sleepTime;
	} else {
		WARNING_1("Runtime Players:%1",_endTime-_startTime);
	};
};