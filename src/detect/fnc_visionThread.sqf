#include "script_component.hpp"

private _setSleepTime = 10;
private _additionalTime = 0;
while {true} do{
	private _startTime = diag_tickTime;

	[_setSleepTime+_additionalTime] call FUNC(updateAllUnits);
	
	private _endTime = diag_tickTime;
	
	_additionalTime = 0;
	
	private _sleepTime = _setSleepTime - (_endTime-_startTime);
	if (_sleepTime > 0) then {
		sleep _sleepTime;
	} else {
		WARNING_1("Runtime Vision:%1",_endTime-_startTime);
		_additionalTime = floor(-1 * _sleepTime);
	};
	
};