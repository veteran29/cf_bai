_reducingTerrains = ["Tree","Bush","SMALL TREE"];
_spotAttribute = "CF_BAI_DEFAULT_SPOT_DISTANCE";
_terrainCountFactor = 100 / ((cf_bai_terrain_maximum_count/10)^2);

diag_log formatText ["[CF_BAI] Terrain count factor is: %1", _terrainCountFactor];

FNC_getMaximumSpotting = {
	_defaultSpot = _this getVariable _spotAttribute;
			
	_currentSpotDistance = _this skill "spotDistance";

	if(isNil "_defaultSpot") then {
		_this setVariable [_spotAttribute,_currentSpotDistance];
	} else {
		if (_currentSpotDistance > _defaultSpot) then {
			_this setVariable [_spotAttribute,_currentSpotDistance];
		};
	};
	
	_this getVariable _spotAttribute;
};

while {true} do{
	{
		if (!isPlayer _x) then {
			_countTerrain = count nearestTerrainObjects [_x, _reducingTerrains, cf_bai_terrain_range];
			
			_terrainImpact = _countTerrain min cf_bai_terrain_maximum_count;

			_maximumSpot = _x call FNC_getMaximumSpotting;
			
			_spottingDistanceRange = _maximumSpot - (_maximumSpot*cf_bai_minimum_spot);
			_decrement = ((_terrainImpact / 10)^2) * _terrainCountFactor * 0.01 * _spottingDistanceRange;
			_finalSpotDistance = _maximumSpot - _decrement;
			
			_x setskill ["spotDistance",_finalSpotDistance];

			diag_log formatText ["[CF_BAI] Terrain count: %1,Maximum Spot: %2, Final Spot:%3", _countTerrain,_maximumSpot,_finalSpotDistance];
		}
		
	} forEach allUnits;

	sleep 10;
};
