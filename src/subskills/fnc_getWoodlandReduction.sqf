#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_getWoodlandReduction
    Gets the woodland reduction being applied to a unit
Parameters:
    _unit: The unit to set the skill on.
Example:
    (begin example)
    _woodland = [_unit] call CF_BAI_fnc_getWoodlandReduction;
    (end)
Returns:
    _woodland: The skill reduction being applied due to foilage, 0 for none and 1 for maximum reduction
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_unit"];

private _unconvertedValue = ["CF_BAI_subskills",_unit,"aimingAccuracy"] call CF_BAI_fnc_getSkillParameter;

_woodland = (1-_unconvertedValue) / (1 - GVAR(minimum_aimingAccuracy));

_woodland;