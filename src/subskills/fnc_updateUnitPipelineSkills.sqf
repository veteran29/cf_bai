#include "script_component.hpp"

params ["_unit","_terrain_impact"];

FNC_hasBaseSkills = {
	params ["_unit"];

	_unit getVariable ["CF_BAI_MAXIMUM",false];
};

FNC_getBaseSkill = {
	params ["_unit","_subSkill","_maximumSkill"];

	private _baseSkill = _maximumSkill;
	if( _maximumSkill <= 0.0 ) then {
		_baseSkill = _unit skill _subSkill;
	};

	_baseSkill;
};

FNC_x2 = {
	params ["_x","_subSkillMultiplier"];

	private _a = 1-_subSkillMultiplier;
	private _x2 = _x * _x;

	1 - (_a * _x2);
};

FNC_getAdjustmentToSkill = {
	params ["_terrain_impact","_subSkillMultiplier"];

	[_terrain_impact,_subSkillMultiplier] call FNC_x2;
};

FNC_update_unit_skills = {
	params ["_unit","_terrain_impact"];
	
	if !([_unit] call FNC_hasBaseSkills) then {
		private _baseSkills = [
			[_unit,"aimingAccuracy",GVAR(maximum_aimingAccuracy)] call FNC_getBaseSkill,
			[_unit,"aimingShake",GVAR(maximum_aimingShake)] call FNC_getBaseSkill,
			[_unit,"aimingSpeed",GVAR(maximum_aimingSpeed)] call FNC_getBaseSkill,
			[_unit,"spotDistance",GVAR(maximum_spotDistance)] call FNC_getBaseSkill,
			[_unit,"spotTime",GVAR(maximum_spotTime)] call FNC_getBaseSkill,
			[_unit,"courage",GVAR(maximum_courage)] call FNC_getBaseSkill,
			[_unit,"reloadSpeed",GVAR(maximum_reloadSpeed)] call FNC_getBaseSkill,
			[_unit,"commanding",GVAR(maximum_commanding)] call FNC_getBaseSkill,
			[_unit,"general",GVAR(maximum_general)] call FNC_getBaseSkill
		];

		[_unit,_baseSkills] call CF_BAI_fnc_setBaseSkills;
		_unit setVariable ["CF_BAI_MAXIMUM",true,false];

		LOG_2("Unit: %1, set the base skills to %2",_unit,_baseSkills);
	};

	private _skillParameters = [
		[_terrain_impact,GVAR(minimum_aimingAccuracy)] call FNC_getAdjustmentToSkill,
		[_terrain_impact,GVAR(minimum_aimingShake)] call FNC_getAdjustmentToSkill,
		[_terrain_impact,GVAR(minimum_aimingSpeed)] call FNC_getAdjustmentToSkill,
		[_terrain_impact,GVAR(minimum_spotDistance)] call FNC_getAdjustmentToSkill,
		[_terrain_impact,GVAR(minimum_spotTime)] call FNC_getAdjustmentToSkill,
		[_terrain_impact,GVAR(minimum_courage)] call FNC_getAdjustmentToSkill,
		[_terrain_impact,GVAR(minimum_reloadSpeed)] call FNC_getAdjustmentToSkill,
		[_terrain_impact,GVAR(minimum_commanding)] call FNC_getAdjustmentToSkill,
		[_terrain_impact,GVAR(minimum_general)] call FNC_getAdjustmentToSkill
	];

	[allUnits select 0,"CF_BAI_subskills",_skillParameters] call CF_BAI_fnc_setSkillsParameters;
};

private _combinedTerrainImpact = _terrain_impact;

private _enemyImpact = [_unit] call FUNC(getEnemyImpact);
if (_enemyImpact >= 0) then {
	_combinedTerrainImpact = (0.5 * _enemyImpact) + (0.5 * _terrain_impact)
};

LOG_4("Unit: %1, TerrainImpact: %2, EnemyImpact: %3, Combined Impact: %4",_unit,_terrain_impact,_enemyImpact,_combinedTerrainImpact);

[_unit, _combinedTerrainImpact] call FNC_update_unit_skills;