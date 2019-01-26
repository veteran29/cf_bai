#include "script_component.hpp"

params ["_ai","_player"];

private _aiToPlayer = [_ai,_player] call FUNC(aiToPlayer);

if (((_aiToPlayer select 0) select 0) > 0.0) then {
	private _playerVisibility = _player getVariable ["CF_BAI_DETECT_VISIBILITY",[]];
	private _aiVision = _ai getVariable ["CF_BAI_DETECT_VISION",[]];
	private _environment = GVAR(environmentConditions);

	_aiToPlayer append _playerVisibility;
	_aiToPlayer append _aiVision;
	_aiToPlayer append _environment;
};

_aiToPlayer;