#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_getSkillParameter
Description:
    Gets a skill parameter
Parameters:
    _key: A String unique to your mod and parameter, for example "CF_BAI_woodland"
    _unit: The unit to set the skill on.
	_subSkill: The name of the subskill such as aimingAccuracy or command
Example:
    (begin example)
    _values = ["CF_BAI_woodland",_unit,"aimingAccuracy"] call CF_BAI_fnc_setSkillParameter;
    (end)
Returns:
    _values: The value of the parameter multiplier for that subSkill
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_key","_unit","_subSkill"];

private _pipelines = [_unit] call FUNCMAIN(getUnitPipeline);

private _skillIndex = [_subSkill] call FUNCMAIN(subSkillToIndex);

private _pipelineIndex = [_key] call FUNCMAIN(register);

private _skillPipeline = _pipelines select _skillIndex;

private _parameter = 1.0;
if (_pipelineIndex < (count _skillPipeline)) then {
    _parameter = _skillPipeline select _pipelineIndex;
};  

_parameter;