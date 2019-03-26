#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_hasBaseSkill
Description:
    Determines if all the base skill has been set yet or not.
Parameters:
	_pipeline: The unit pipeline to check
Example:
    (begin example)
    _hasSkills = [_pipeline] call CF_BAI_fnc_hasBaseSkill;
    (end)
Returns:
    Boolean: true if the base skill is set, otherwise false.
Author:
    BrightCandle
---------------------------------------------------------------------------- */

params ["_pipeline"];

LOG_1("base pipeline:%1",_pipeline);

if ((_pipeline select 0) <0) then {
	false;
} else { true };