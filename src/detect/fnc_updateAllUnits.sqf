#include "script_component.hpp"

params ["_observationTime"];
//old buggy routine for iterating all AI
{
	if (!isPlayer _x && alive _x) then {
		private _ai = _x;
		
		{
			if (alive _x) then {
				private _player = _x;
				
				[_ai,_player,_observationTime] call FUNC(updateKnowsAbout);

			};
		} forEach (allPlayers - entities "HeadlessClient_F");
	};
	sleep 0.1;
} forEach allUnits;