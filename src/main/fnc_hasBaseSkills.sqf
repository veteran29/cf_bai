#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_hasBaseSkills
Description:
    Determines if all the  base skills has been set yet or not.
Parameters:
	_pipeline: The units pipeline to check
Example:
    (begin example)
    _hasSkills = [_pipelines] call CF_BAI_fnc_hasBaseSkills;
    (end)
Returns:
    Boolean: true if all base skills are set, otherwise false.
Author:
    BrightCandle
---------------------------------------------------------------------------- */

params ["_pipelines"];
private _hasBaseSkills = true;
{
    if ((_x select 0) <0) exitWith {
        _hasBaseSkills = false;
    };
}forEach _pipelines;

_hasBaseSkills;