#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_getSuppression
Description:
    Gets the units current suppression
Parameters:
    _unit: The unit to set the skill on.
Example:
    (begin example)
    _suppression = [_unit] call CF_BAI_Suppression_fnc_getSuppression;
    (end)
Returns:
    _suppression: The current suppression between 0 and 1 where 1 is the most suppressed
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_unit"];

private _unconvertedValue = ["CF_BAI_suppression",_unit,"aimingAccuracy"] call CF_BAI_fnc_getSkillParameter;

_suppression = (1-_unconvertedValue) / (1 - GVAR(aimingAccuracy));

_suppression;