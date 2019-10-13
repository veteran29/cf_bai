#include "script_component.hpp"

private _reducingTerrains = ["Tree","Bush","SMALL TREE"];

sleep GVAR(sleep);

while {true} do{
	private _maxTerrainCount = [] call FUNC(terrainCount);
	
	LOG_1("Max Terrain count is: %1", _maxTerrainCount);

	private _startTime = diag_tickTime;
	{
		private _terrainCount = count nearestTerrainObjects [_x, _reducingTerrains, GVAR(terrain_range),false,true];
		private _terrainImpact = (_terrainCount min _maxTerrainCount)/_maxTerrainCount;

		if (!isPlayer _x) then {
			[_x,_terrainImpact] call FUNC(updateUnitPipelineSkills);
		} else {
			[_x,_terrainImpact] call FUNC(setGroupTerrainImpact);	
		};
		sleep 0.02;
	} forEach allUnits;
	
	private _endTime = diag_tickTime;
	
	LOG_1("Runtime:%1",_endTime-_startTime);
	
	private _sleepTime = 10 - (_endTime-_startTime);
	if (_sleepTime > 0) then {
		sleep _sleepTime;
	};
};
