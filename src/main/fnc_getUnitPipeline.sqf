#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_getUnitPipeline
Description:
    gets the units pipelines
Parameters:
    _unit: The unit on which to get the value
Example:
    (begin example)
    [_unit] call FUNC(getUnitPipeline);
    (end)
Returns:
    An Array of arrays containing the skill pipelines:
Author:
    BrightCandle
---------------------------------------------------------------------------- */

params ["_unit"];

_unit getVariable ["CF_BAI_SKILLPIPELINE",[[-1],[-1],[-1],[-1],[-1],[-1],[-1],[-1],[-1]] ];