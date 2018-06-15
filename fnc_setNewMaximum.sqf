#include "script_component.hpp"

params ["_skill","_skillMaximum"];

if(_skillMaximum == 0.00) exitWith {
	true;
};

private _attributeName = [_skill] call FUNC(subSkillToAttribute);

LOG_2("Updating all units for skill:%1 and maximum:%2",_skill,_skillMaximum);

{
	if (!isPlayer _x) then {
		_x setVariable [_attributeName,_skillMaximum];
	};
} forEach allUnits;