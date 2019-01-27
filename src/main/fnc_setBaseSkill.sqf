#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_setBaseSkill
Description:
    Sets the units base subskill. This is the skill on which other modifications can be done.
Parameters:
	_unit: The unit to set the skill on.
	_subSkill: The name of the subskill such as accuracy or command
    _skill: The skill value, 0-1
Example:
    (begin example)
    _key = [_unit, _"aimingAccuracy",0.85] call CF_BAI_fnc_setBaseSkill;
    (end)
Returns:
    Nothing
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_unit","_subSkill","_skill"];

private _pipelines = [_unit] call FUNCMAIN(getUnitPipeline);

private _skillIndex = [_subSkill] call FUNCMAIN(subSkillToIndex);

private _skillPipeline = _pipelines select _skillIndex;

_skillPipeline set [0,_skill];

[_unit,_pipelines] call FUNCMAIN(setUnitPipeline);

[_unit,_subSkill] call FUNCMAIN(recalculateSkill);