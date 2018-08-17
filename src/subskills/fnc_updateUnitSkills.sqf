#include "script_component.hpp"

params ["_unit","_terrain_impact","_terrainCountFactor"];

FNC_getConfiguredMaximumSkill = {
	params ["_unit","_skill"];

	private _generated_maximumskill_name = QGVAR(maximum) +"_"+ _skill;

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
	params ["_x","_terrainCountFactor","_minimumPercentage", "_maximum"];
	
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
		[_unit,_skill,_final_skill] call FUNC(setTpwcasSkill);
	} else {
		_unit setskill [_skill,_final_skill];
	};
};

FNC_update_individual_skill = {
	params ["_unit","_terrain_impact","_terrainCountFactor","_skill","_skill_attribute","_config_minimum_skill_percentage"];
	
	private _maximum_skill = [_unit,_skill,_skill_attribute] call FNC_getMaximumSkill;
	private _final_skill = [_terrain_impact,_terrainCountFactor,_config_minimum_skill_percentage,_maximum_skill] call FNC_x2;
	[_unit,_skill,_final_skill] call FNC_set_skill;
	
	LOG_5("Unit: %1 Terrain impact: %2 Skill:%3 Maximum Skill: %4 Final Skill:%5", _unit, _terrain_impact,_skill,_maximum_skill,_final_skill);

	_final_skill
};

FNC_update_unit_skills = {
	params ["_unit","_terrain_impact","_terrainCountFactor"];
	
	[_unit,_terrain_impact,_terrainCountFactor,"spotDistance","CF_BAI_DEFAULT_SPOT_DISTANCE",GVAR(minimum_spotDistance)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,_terrainCountFactor,"aimingAccuracy","CF_BAI_DEFAULT_AIMING_ACCURACY",GVAR(minimum_aimingAccuracy)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,_terrainCountFactor,"aimingSpeed","CF_BAI_DEFAULT_AIMING_SPEED",GVAR(minimum_aimingSpeed)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,_terrainCountFactor,"commanding","CF_BAI_DEFAULT_COMMANDING",GVAR(minimum_commanding)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,_terrainCountFactor,"spotTime","CF_BAI_DEFAULT_SPOT_TIME",GVAR(minimum_spotTime)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,_terrainCountFactor,"courage","CF_BAI_DEFAULT_COURAGE",GVAR(minimum_courage)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,_terrainCountFactor,"aimingShake","CF_BAI_DEFAULT_AIMING_SHAKE",GVAR(minimum_aimingShake)] call FNC_update_individual_skill;
	[_unit,_terrain_impact,_terrainCountFactor,"general","CF_BAI_DEFAULT_GENERAL",GVAR(minimum_general)] call FNC_update_individual_skill;
};

[_unit, _terrain_impact,_terrainCountFactor] call FNC_update_unit_skills;