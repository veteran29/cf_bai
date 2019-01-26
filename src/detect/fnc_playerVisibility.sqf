#include "script_component.hpp"

params ["_player"];

CF_BAI_DETECT_FNC_stance = {
	params ["_player"];

	private _stance = stance _player;

	private _name="stance";

	private _result = [0,0];
	switch (_stance) do {
		case "STAND":{ _result = [GVAR(playerVisibility_standing_chance),GVAR(playerVisibility_standing_knowledge),_name]; };
		case "CROUCH": { _result = [GVAR(playerVisibility_crouch_chance),GVAR(playerVisibility_crouch_knowledge),_name]; };
		case "PRONE": { _result = [GVAR(playerVisibility_prone_chance),GVAR(playerVisibility_prone_knowledge),_name]; };
		case "UNDEFINED":{ _result = [1.0,1.0,_name]; };
		default { _result = [1.0,1.0,_name]; };
	};

	_result;
};

CF_BAI_DETECT_FNC_player_movement = {
	params ["_player"];

	private _SPRINT_SPEED = 18.1;
	private _percentage = ((speed _player) /_SPRINT_SPEED) min 1.0 max 0.0;

	private _chance = GVAR(playerVisibility_movement) + (_percentage *(1-GVAR(playerVisibility_movement)));
	[_chance, GVAR(playerVisibility_movement_knowledge),"playerMovement"];
};

CF_BAI_DETECT_FNC_foliage = {
	params ["_player"];
	private _reducingTerrains = ["Tree","Bush","SMALL TREE"];
	private _terrainCount = count nearestTerrainObjects [_player, _reducingTerrains, 10,false,true];

	private _percentage = 1.0 - ((_terrainCount / GVAR(playerVisibility_terrain_count)) min 1.0);

	[_percentage, _percentage,"playerFoliage"];
};

private _stance = [_player] call CF_BAI_DETECT_FNC_stance;
private _movement = [_player] call CF_BAI_DETECT_FNC_player_movement;
private _foilage = [_player] call CF_BAI_DETECT_FNC_foliage;

[_stance,_movement,_foilage];