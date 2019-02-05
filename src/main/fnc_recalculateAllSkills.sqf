#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_recalculateAllSkills
Description:
    Sets all the units sub skills based on skills pipeline
Parameters:
	_unit: The unit to set the skill on.
Example:
    (begin example)
    _key = [_unit] call CF_BAI_fnc_recalculateAllSkills;
    (end)
Returns:
    Nothing
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_unit"];

private _pipelines = [_unit] call FUNCMAIN(getUnitPipeline);

if ([_pipelines] call FUNCMAIN(hasBaseSkills)) then {
	{
		private _calcSkill = 1.0;
		{
			_calcSkill = _calcSkill * _x;
		}forEach _x;

		_subSkill = [_forEachIndex] call FUNCMAIN(indexToSubSkill);
		_unit setSkill [_subSkill,_calcSkill];

	}forEach _pipelines;
	LOG_2("Unit: %1, all subskills recalculated to: %2 pipelines",_unit,_pipelines);
};