#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_setUnitPipeline
Description:
    sets the units pipelines
Parameters:
    _unit: The unit on which to set the value
	_pipeline: The replacement pipeline value
Example:
    (begin example)
    [_unit,_pipelines] call FUNC(setUnitPipeline);
    (end)
Returns:
    Nothing
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_unit","_pipelines"];

_unit setVariable ["CF_BAI_SKILLPIPELINE",_pipelines,false];