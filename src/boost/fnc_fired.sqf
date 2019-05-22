#include "script_component.hpp"

params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

private _boostParameters = _unit getVariable ["CF_BAI_boost",[objNull,[0,0,0],0,0]];
//0 priorTarget, 1 shots fired
private _priorTarget = _boostParameters select 0;
private _priorPosition = _boostParameters select 1;
private _fireCount = _boostParameters select 2;
private _lastShotTime = _boostParameters select 3;

private _target = assignedTarget _unit;
private _targetPosition = position _target;

private _currentTime = time;

if !(isNil "_target" || {isNull _target}) then {
	if (isNull _priorTarget) then {
		[_unit,_targetPosition] spawn FUNC(terminateBoostThread);

		LOG_4("First Shot - Unit: %1, Assigned target is %2, prior target is %3, FireCount: %4",_unit,_target,_priorTarget,_fireCount);
		_priorTarget = _target;
	};

	if ((_currentTime - _lastShotTime > GVAR(minimumShotInterval)) && (_unit distance _target>GVAR(minimumShotDistance))) then {
		_fireCount = _fireCount +1;
		private _skillMultiplier = (((_fireCount / GVAR(bulletsToMaxBoost)) min 1)  * (GVAR(maxBoost) -1)) + 1;

		LOG_5("Shot - Unit: %1, AssignedTarget: %2, PriorTarget:%3, FireCount:%4, skillMultiplier: %5",_unit,_target,_priorTarget, _fireCount, _skillMultiplier);

		[_unit,_skillMultiplier] call FUNC(setSubSkills);
	} else {
		LOG_2("Shot rejected for boost time:%1, distance:%2",_currentTime - _lastShotTime,_unit distance _target)
	};
	
	_unit setVariable ["CF_BAI_boost",[_priorTarget,_targetPosition,_fireCount,_currentTime],false];

} else {
	LOG_1("No assigned target was found in fired for unit: %1",_unit);
};