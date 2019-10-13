#include "script_component.hpp"

params ["_aiUnit"];

private _aiSide = side _aiUnit;

//find closest group in view distance

FNC_closestGroupLead = {
	params ["_aiUnit"];
	//[Unit, angle, distance]
	private _bestMatch = [grpNull,359,100000];
	{ 
		private _groupLead = leader _x;
		private _groupSide = side _groupLead;

		//group leader must be a player, not on the same side and within front angle of 90
		if(_aiSide != _groupSide && isPlayer _groupLead) then {
			private _angle = abs (getDir _aiUnit - (_aiUnit getDir _groupLead));
			if(_angle <= 90) then {
				private _distance = _aiUnit distance _groupLead;
				if(_distance <= _bestMatch select 2) then {
					_bestMatch = [_groupLead,_angle,_distance];
				};
			};
		};
	} forEach allGroups;

	_bestMatch select 0;
};

FNC_averageGroupTerrainImpact = {
	params ["_groupLead"];

	private _units = units _groupLead;
	private _impactSum = 0;
	{
		private _unitCachedImpact =  _x getVariable ["CF_BAI_TerrainImpact",0];
		LOG_2("Cached Impact Unit:%1, impact is: %2",_x,_unitCachedImpact);
		_impactSum = _impactSum + _unitCachedImpact;
	}forEach _units;

	_impactSum / (count _units);
};

private _groupLead = [_aiUnit] call FNC_closestGroupLead;
if !(isNull _groupLead) then {

	private _terrainImpact = [_groupLead] call FNC_averageGroupTerrainImpact;

	LOG_2("Best Enemy found:%1, impact is: %2",_groupLead,_terrainImpact);

	_terrainImpact
} else {
	-1;
}