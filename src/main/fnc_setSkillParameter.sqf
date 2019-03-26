#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_setSkillParameter
Description:
    Sets a skill parameter, which will be multiplied by the base skill and other skill parameters to determine the units final skill value.
Parameters:
    _key: A String unique to your mod and parameter, for example "CF_BAI_woodland"
	_subSkill: The name of the subskill such as aimingAccuracy or command
	_parameter: A float value, 1.0 is no change from the default skill, 0.5 would be halve the skill, 2.0 would be double it (finalSkill will always end between 0.0 and 1.0)
	_unit: The unit to set the skill on.
Example:
    (begin example)
    _key = ["CF_BAI_woodland",_unit,"aimingAccuracy",0.5] call CF_BAI_fnc_setSkillParameter;
    (end)
Returns:
    _key: The key to use when setting skills.
	For the same string into will provide the same key output so can be called many times if needed.
Author:
    BrightCandle
---------------------------------------------------------------------------- */
params ["_key","_unit","_subSkill","_parameter"];

private _pipelines = [_unit] call FUNCMAIN(getUnitPipeline);

LOG_1("pipelines:%1",_pipelines);

private _skillIndex = [_subSkill] call FUNCMAIN(subSkillToIndex);

private _pipelineIndex = [_key] call FUNCMAIN(register);

private _skillPipeline = _pipelines select _skillIndex;

LOG_1("skillPipeline:%1",_skillPipeline);

private _countSkillPipeline =count _skillPipeline;
if (_countSkillPipeline < _pipelineIndex+1) then {//pad out the array wih 1s
	_skillPipeline resize (_pipelineIndex+1);

	for "_i" from (_countSkillPipeline) to (_pipelineIndex-1) do { // this with -1 might fail in testing and might need to set that value twice
		_skillPipeline set [_i,1];
	};
};

LOG_1("skillPipeline after expansion:%1",_skillPipeline);

_skillPipeline set [_pipelineIndex,_parameter];

[_unit,_pipelines] call FUNCMAIN(setUnitPipeline);

[_unit,_subSkill] call FUNCMAIN(recalculateSkill);