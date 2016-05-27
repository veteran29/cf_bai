_reducingTerrains = ["Tree","Bush","SMALL TREE"];
_spotAttribute = "CF_BAI_DEFAULT_SPOT_DISTANCE";
_terrainCountFactor = 100 / ((cf_bai_terrain_maximum_count/10)^2);

diag_log formatText ["[CF_BAI] Terrain count factor is: %1", _terrainCountFactor];

FNC_getMaximumSkill = {
	params ["_unit","_skill", "_skill_attribute"];
	
	_default_skill = _unit getVariable _skill_attribute;
			
	_current_skill = _unit skill _skill;

	if(isNil "_default_skill") then {
		_unit setVariable [_skill_attribute,_current_skill];
	};
	
	_unit getVariable _skill_attribute;
	
};

FNC_x2 = {
	params ["_x","_minimumPercentage", "_maximum"];
	
	_minimum = (_maximum*_minimumPercentage);
	_range = _maximum - _minimum;
	_decrement = ((_x / 10)^2) * _terrainCountFactor * 0.01 * _range;
	_final = _maximum - _decrement;
	_final;
};

FNC_set_skill = {
	params ["_unit","_skill","_final_skill"];
  
	_tpwcas_orig_accuracy = _unit getVariable ["tpwcas_originalaccuracy",-2];
  
	if(_tpwcas_orig_accuracy != -2) then {
		[_unit,_skill,_final_skill] call FNC_setskill_tpwcas;
	} else {
		_unit setskill [_skill,_final_skill];
	};
};

FNC_update_individual_skill = {
	params ["_unit","_terrain_impact","_skill","_skill_attribute","_config_minimum_skill_percentage"];
	
	_maximum_skill = [_unit,_skill,_skill_attribute] call FNC_getMaximumSkill;
	_final_skill = [_terrain_impact,_config_minimum_skill_percentage,_maximum_skill] call FNC_x2;
	[_unit,_skill,_final_skill] call FNC_set_skill;
	
	if( cf_bai_debug_logging ) then {
	  diag_log formatText ["[CF_BAI] Unit: %1, Terrain impact: %2,Skill:%3, Maximum Skill: %4, Final Skill:%5", _unit, _terrain_impact,_skill,_maximum_skill,_final_skill];
	};
	
};

FNC_update_unit_skills = {
	params ["_unit","_terrain_impact"];
	
	[_unit,_terrain_impact,"spotDistance","CF_BAI_DEFAULT_SPOT_DISTANCE",cf_bai_minimum_spot_distance] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"aimingAccuracy","CF_BAI_DEFAULT_AIMING_ACCURACY",cf_bai_minimum_aiming_accuracy] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"aimingSpeed","CF_BAI_DEFAULT_AIMING_SPEED",cf_bai_minimum_aiming_speed] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"commanding","CF_BAI_DEFAULT_COMMANDING",cf_bai_minimum_commanding] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"spotTime","CF_BAI_DEFAULT_SPOT_TIME",cf_bai_minimum_spot_time] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"courage","CF_BAI_DEFAULT_COURAGE",cf_bai_minimum_courage] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"aimingShake","CF_BAI_DEFAULT_AIMING_SHAKE",cf_bai_minimum_aiming_shake] call FNC_update_individual_skill;
};

while {true} do{
	_startTime = diag_tickTime;
	{
		if (!isPlayer _x) then {
			_countTerrain = count nearestTerrainObjects [_x, _reducingTerrains, cf_bai_terrain_range];
			
			_terrainImpact = _countTerrain min cf_bai_terrain_maximum_count;
			
			[_x,_terrainImpact] call FNC_update_unit_skills;
		}
		
	} forEach allUnits;
	
	_endTime = diag_tickTime;
	
	if( cf_bai_debug_logging ) then {
	  diag_log formatText ["[CF_BAI] Runtime:%1",_endTime-_startTime];
	};
	
	sleep 10;
};
