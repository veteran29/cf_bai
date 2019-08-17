#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_Boost_fnc_getBoost
Description:
    Gets the units current suppression
Parameters:
    _unit: The unit to set the skill on.
Example:
    (begin example)
    _boost = [_unit] call CF_BAI_fnc_getBoost;
    (end)
Returns:
    _boost: The current boost multiplier, a value usually above 1 where 1 means no boost
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_unit"];

private _parameterValue = ["CF_BAI_boost",_unit,"aimingAccuracy"] call CF_BAI_fnc_getSkillParameter;

_boostPercentage = (_parameterValue -1) /  (GVAR(maxBoost) -1);

_boostPercentage;