#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_calculateAndSetSkill
Description:
    Sets the units skill based on skills pipeline 
Parameters:
    _key: A String unique to your mod and parameter, for example "CF_BAI_woodland"
	_subSkill: The name of the subskill such as accuracy or command
	_parameter: A float value, 1.0 is no change from the default skill, 0.5 would be halve the skill, 2.0 would be double it (finalSkill is always between 0.0 and 1.0)
	_unit: The unit to set the skill on.
Example:
    (begin example)
    _key = ["CF_BAI_woodland"] call CF_BAI_fnc_register;
    (end)
Returns:
    _key: The key to use when setting skills.
	For the same string into will provide the same key output so can be called many times if needed.
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_unit","_subSkill"];

private _pipelines = [_unit] call FUNCMAIN(getUnitPipeline);

LOG_1("Recalculate pipelines:%1",_pipelines);

private _skillIndex = [_subSkill] call FUNCMAIN(subSkillToIndex);

private _skillPipeline = _pipelines select _skillIndex;

LOG_1("Pipelines:%1",_skillPipeline);

if ([_skillPipeline] call FUNCMAIN(hasBaseSkill)) then {
    private _calcSkill = 1.0;
    {
        _calcSkill = _calcSkill * _x;
    }forEach _skillPipeline;

    _unit setSkill [_subSkill,_calcSkill];
    LOG_3("Unit: %1, Skill %2 recalculated to: %3 from pipeline",_unit,_subSkill,_calcSkill);
};

