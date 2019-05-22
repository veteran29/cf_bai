#include "script_component.hpp"

params ["_unit","_position"];

CF_BAI_boost_FNC_positionsClose = {
	params ["_pos1","_pos2"];
    
    (_pos1 distance _pos2) < GVAR(toleranceRange);
};

private _assignedTarget = assignedTarget _unit;
private _targetPosition = _position;
private _posClose = [_position,_targetPosition] call CF_BAI_boost_FNC_positionsClose;

LOG_4("Monitoring boost - Unit:%1, Alive:%2, AssignTarget: %3, Close:%4",_unit, alive _unit,_assignedTarget,_posClose );

while {(alive _unit) && _posClose} do {
    sleep GVAR(targetChangeSleepTime);

    _assignedTarget = assignedTarget _unit;
    
    if(!isNull _assignedTarget) then {
        _targetPosition = position _assignedTarget;
        _posClose = [_position,_targetPosition] call CF_BAI_boost_FNC_positionsClose;
    };
};

LOG_4("Terminating boost for Unit:%1, Alive: %2, Close:%3, AssignedTarget:%4",_unit, alive _unit,_posClose,_assignedTarget );

[_unit,1.0] call FUNC(setSubSkills);

_unit setVariable ["CF_BAI_boost",[objNull,[0,0,0],0,0],false];