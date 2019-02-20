#include "script_component.hpp"

params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

LOG_1("Fired triggered by %1",_unit);

private _priorTarget = _unit getVariable "CF_BAI_boost_target";

private _target = assignedTarget _unit;

if (isNil _priorTarget) then {

	[_unit,1.0] call FUNC(setSubSkills);
};

if (!isNil _target) then {
	if (_priorTarget == _target) then {
		[_unit,1.25] call FUNC(setSubSkills);
	} else {
		[_unit,1.0] call FUNC(setSubSkills);
	};
	_unit setVariable ["CF_BAI_boost_target",_target,false];
} else {
	WARNING_1("unit %1 had a nil assignedTarget",_unit);
};
