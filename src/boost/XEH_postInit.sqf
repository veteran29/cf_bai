#include "script_component.hpp"

params ["_unit"];

if !(GVAR(disableBoost) || 
	(isPlayer _unit) || 
	!(local _unit) ) then {

	LOG_1("Fire handler added to unit:%1",_unit);

	_unit addEventHandler ["FiredMan", {
		_this call FUNC(fired);
	}];
};