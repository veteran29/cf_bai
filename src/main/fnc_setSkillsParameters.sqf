#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_setSkillsParameters
Description:
    Sets all of the sub skills for a units for the array of parameters passed
Parameters:
	_unit: The unit to set the skill on.
	_skills: An Array of parameters for subskills in the following order:
		aimingAccuracy,aimingShake,aimingSpeed,spotDistance,spotTime,courage,reloadSpeed,commanding,general
Example:
    (begin example)
    [_unit,[1,1,1,1,1,1,1,1,1]] call CF_BAI_fnc_setSkillsParameters;
    (end)
Returns:
    Nothing
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_unit","_key","_skills"];

if (count _skills == 9) then {
	private _pipelines = [_unit] call FUNCMAIN(getUnitPipeline);

	private _parameterIndex = [_key] call FUNCMAIN(register);

	for "_i" from 0 to 8 do {
		private _pipeline = (_pipelines select _i);
	
		private _countPipeline =count _pipeline;
		if (_countPipeline < _parameterIndex+1) then {//pad out the array wih 1s
			_pipeline resize (_parameterIndex+1);

			for "_i" from (_countPipeline) to (_parameterIndex-1) do { // this with -1 might fail in testing and might need to set that value twice
				_pipeline set [_i,1];
			};
		};

		_pipeline set [_parameterIndex,_skills select _i];
	};

	[_unit,_pipelines] call FUNCMAIN(setUnitPipeline);

	[_unit] call FUNCMAIN(recalculateAllSkills);
};