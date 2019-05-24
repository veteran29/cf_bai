#include "script_component.hpp"
//suppression none is 0.0 and max is 1.0
params ["_unit","_suppression"];

private _suppressionMultiplier = 1.0 - _suppression;

FNC_x = {
	params ["_x","_subSkillMultiplier"];

	private _a = 1-_subSkillMultiplier;

	1 - (_a * _x);
};

private _skills = [
	[_suppression,GVAR(aimingAccuracy)] call FNC_x, 
	[_suppression,GVAR(aimingShake)] call FNC_x,
	[_suppression,GVAR(aimingSpeed)] call FNC_x,
	[_suppression,GVAR(spotDistance)] call FNC_x,
	[_suppression,GVAR(spotTime)] call FNC_x,
	[_suppression,GVAR(courage)] call FNC_x,
	[_suppression,GVAR(reloadSpeed)] call FNC_x,
	[_suppression,GVAR(commanding)] call FNC_x,
	[_suppression,GVAR(general)] call FNC_x
];

LOG_2("Unit: %1, Skills: %2",_unit,_skills);

[_unit,"CF_BAI_suppression",_skills] call CF_BAI_fnc_setSkillsParameters;

LOG_3("Unit: %1, Pipeline: %2, Accuracy: %3", _unit, (_unit getVariable ["CF_BAI_SKILLPIPELINE"]), (_unit skillFinal "aimingAccuracy") );