#include "script_component.hpp"

private _reducingTerrains = ["Tree","Bush","SMALL TREE"];

sleep GVAR(sleep);

FNC_getConfiguredMaximumSkill = {
	params ["_unit","_skill"];

	private _generated_maximumskill_name = QGVAR(maximum_) + _skill;

	LOG_1("Generated maximum skill name: %1",_generated_maximumskill_name);
	
	private _max_skill = currentNamespace getVariable(_generated_maximumskill_name);
	
	if( _max_skill <= 0.0 ) then {
		_max_skill = _unit skill _skill;
	};
	
	LOG_2("Maximum skill:%1,value:%2",_skill,_max_skill);
	
	_max_skill;
};

FNC_getMaximumSkill = {
	params ["_unit","_skill", "_skill_attribute"];

	private _default_skill = _unit getVariable _skill_attribute;

	if(isNil "_default_skill") then {
		private _configured_max_skill = [_unit,_skill] call FNC_getConfiguredMaximumSkill;
	
		_unit setVariable [_skill_attribute,_configured_max_skill];
	};
	
	_unit getVariable _skill_attribute;
	
};

FNC_x2 = {
	params ["_x","_minimumPercentage", "_maximum"];
	
	private _minimum = (_maximum*_minimumPercentage);
	private _range = _maximum - _minimum;
	private _decrement = ((_x / 10)^2) * _terrainCountFactor * 0.01 * _range;
	private _final = _maximum - _decrement;
	_final;
};

FNC_set_skill = {
	params ["_unit","_skill","_final_skill"];
  
	private _tpwcas_orig_accuracy = _unit getVariable ["tpwcas_originalaccuracy",-2];
  
	if(_tpwcas_orig_accuracy != -2) then {
		[_unit,_skill,_final_skill] call FUNC(setskill_tpwcas);
	} else {
		_unit setskill [_skill,_final_skill];
	};
};

FNC_update_individual_skill = {
	params ["_unit","_terrain_impact","_skill","_skill_attribute","_config_minimum_skill_percentage"];
	
	private _maximum_skill = [_unit,_skill,_skill_attribute] call FNC_getMaximumSkill;
	private _final_skill = [_terrain_impact,_config_minimum_skill_percentage,_maximum_skill] call FNC_x2;
	[_unit,_skill,_final_skill] call FNC_set_skill;
	
	LOG_5("Unit: %1 Terrain impact: %2 Skill:%3 Maximum Skill: %4 Final Skill:%5", _unit, _terrain_impact,_skill,_maximum_skill,_final_skill);
	_final_skill
};

FNC_update_unit_skills = {
	params ["_unit","_terrain_impact"];
	
	[_unit,_terrain_impact,"spotDistance","CF_BAI_DEFAULT_SPOT_DISTANCE",GVAR(minimum_spotDistance)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"aimingAccuracy","CF_BAI_DEFAULT_AIMING_ACCURACY",GVAR(minimum_aimingAccuracy)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"aimingSpeed","CF_BAI_DEFAULT_AIMING_SPEED",GVAR(minimum_aimingSpeed)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"commanding","CF_BAI_DEFAULT_COMMANDING",GVAR(minimum_commanding)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"spotTime","CF_BAI_DEFAULT_SPOT_TIME",GVAR(minimum_spotTime)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"courage","CF_BAI_DEFAULT_COURAGE",GVAR(minimum_courage)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"aimingShake","CF_BAI_DEFAULT_AIMING_SHAKE",GVAR(minimum_aimingShake)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,"general","CF_BAI_DEFAULT_GENERAL",GVAR(minimum_general)] call FNC_update_individual_skill;
};

while {true} do{
	private _maxTerrainCount = [] call FUNC(terrain_count);
	private _terrainCountFactor = 100 / ((_maxTerrainCount/10)^2);
	
	LOG_2("Max Terrain count is: %1, Terrain count factor is %2", _maxTerrainCount,_terrainCountFactor);

	private _startTime = diag_tickTime;
	{
		if (!isPlayer _x) then {
			private _terrainCount = count nearestTerrainObjects [_x, _reducingTerrains, GVAR(terrain_range),false];
			
			private _terrainImpact = _terrainCount min _maxTerrainCount;
			
			[_x,_terrainImpact] call FNC_update_unit_skills;
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
