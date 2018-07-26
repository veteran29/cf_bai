#include "script_component.hpp"

private _reducingTerrains = ["Tree","Bush","SMALL TREE"];

sleep GVAR(sleep);

while {true} do{
	private _maxTerrainCount = [] call FUNC(terrainCount);
	private _terrainCountFactor = 100 / ((_maxTerrainCount/10)^2);
	
	LOG_2("Max Terrain count is: %1, Terrain count factor is %2", _maxTerrainCount,_terrainCountFactor);

	private _startTime = diag_tickTime;
	{
		if (!isPlayer _x) then {
			private _terrainCount = count nearestTerrainObjects [_x, _reducingTerrains, GVAR(terrain_range),false];
			
			private _terrainImpact = _terrainCount min _maxTerrainCount;
			
			[_x,_terrainImpact,_terrainCountFactor] call FUNC(updateUnitSkills);
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
