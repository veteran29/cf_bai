#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_setBaseSkills
Description:
    Sets all of the units base subskills at once.
Parameters:
	_unit: The unit to set the skill on.
	_skills: An Array of subskills in the following order:
		aimingAccuracy,aimingShake,aimingSpeed,spotDistance,spotTime,courage,reloadSpeed,commanding,general
Example:
    (begin example)
    _key = [_unit,[1,1,1,1,1,1,1,1,1]] call CF_BAI_fnc_setBaseSkills;
    (end)
Returns:
    Nothing
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_unit","_skills"];

if (count _skills == 9) then {
	private _pipelines = [_unit] call FUNCMAIN(getUnitPipeline);

	for "_i" from 0 to 8 do {
		(_pipelines select _i) set [0,_skills select _i];
	};

	[_unit,_pipelines] call FUNCMAIN(setUnitPipeline);

	[_unit] call FUNCMAIN(recalculateAllSkills);
};

