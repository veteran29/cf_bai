#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CF_BAI_fnc_register
Description:
    PreRegisters a pipeline parameter and provides a key that allows fast access to change the parameter on a unit.
Parameters:
    _name: A String unique to your mod and parameter, for example CF_BAI_woodland
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

params ["_name"];

if isNil(QGVAR(registeredParameters)) then {
	GVAR(registeredParameters) = ["CF_BAI_BASE"];
};

private _key = -1;

if !(isNil "_name") then {
	_index = GVAR(registeredParameters) find _name;
	if (_index != -1) then {
		_key = _index;
	}else {
		_key = GVAR(registeredParameters) pushBack _name;
	};
};

_key;
