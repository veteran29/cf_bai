/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_setBaseSkill
Description:
    Sets the units base subskill. This is the skill on which other modifications can be done.
Parameters:
    _key: A String unique to your mod and parameter, for example "CF_BAI_woodland"
	_subSkill: The name of the subskill such as accuracy or command
	_parameter: A float value, 1.0 is no change from the default skill, 0.5 would be halve the skill, 2.0 would be double it (finalSkill is always between 0.0 and 1.0)
Example:
    (begin example)
    _key = ["CF_BAI_woodland"] call CF_BAI_fnc_register;
    (end)
Returns:
    _key: The key to use when setting skills.
	For the same string into will provide the same key output so can be called many times if needed.
Author:
    BrightCandle
---------------------------------------------------------------------------- */

params ["_subskill"];

switch (_subSkill) do{
	case "aimingAccuracy": {0};
	case "aimingShake": {1};
	case "aimingSpeed": {2};
	case "spotDistance": {3};
	case "spotTime": {4};
	case "courage": {5};
	case "reloadSpeed": {6};
	case "commanding": {7};
	case "general": {8};
	default {-1};
};
