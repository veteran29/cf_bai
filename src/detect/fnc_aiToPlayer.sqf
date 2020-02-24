#include "script_component.hpp"

params ["_ai","_player"];

//This is an optimisation vision test to avoid calling other vision tests if the unit already knows everything
CF_BAI_DETECT_FNC_getExistingKnowledge = {
	params ["_ai","_player"];

	private _existingKnowledge = _ai knowsAbout _player;

	if(_existingKnowledge >= 4.0) then {
		[0.0,0.0,"existingKnowledge"];
	} else {
		[1.0,1.0,"existingKnowledge"];
	};
};

//Scales chance of visibility based on how close the player is to the facing of the AI
CF_BAI_DETECT_FNC_get_facing = {
	params ["_ai","_player"];

	private _angle = abs (getDir _ai - (_ai getDir _player));

	private _name = "aiFacing";
	
	if (_angle > 90) then {
		//cant see out of 90 degrees off centre
		[0.0,0.0,_name];
	} else {
		if (_angle > 5) then {
			//linear falloff to 0 to 90degrees (which is FOV of 180)
			_percentage = (_angle - 5) / (90-5);
			[1.0 - _percentage ,1.0 - _percentage,_name];
		} else {
			//under 45 degrees is straight ahead
			[1.0,1.0,_name];
		};
	};
};

//Gets the probability and knows about based on distance, 0.0 past 1.5KM
CF_BAI_DETECT_FNC_get_distance = {
	params ["_ai","_player"];
	
	private _spotDistanceSkill = _ai skillFinal "spotDistance";

	private _maxDistance = GVAR(aiplayervision_max_distance) * _spotDistanceSkill;

	private _minimumDistance = 200 + (_spotDistanceSkill * 100);

	private _distance = _ai distance _player;
	
	private _result = [0,0,"distance"];

	if(_distance < _minimumDistance) then {
		_result = [0.0,0.0,"distance"];
	};

	if(_distance >= _minimumDistance && _distance < _maxDistance) then {
		private _probability =1.0 - ((_distance - _minimumDistance)/(_maxDistance-_minimumDistance));
		_result =  [_probability,_probability,"distance"];
	};
	
	_result;
};

CF_BAI_DETECT_FNC_ray_cast = {
	params ["_ai","_player"];

	_cansee = [objNull, "VIEW"] checkVisibility [eyePos _ai,eyePos _player];

	[_cansee,_cansee,"raycast"];
};

private _knowledge = [_ai,_player] call CF_BAI_DETECT_FNC_getExistingKnowledge;

if ((_knowledge select 0) > 0.0) then {
	//short cut to save computation time in increasing cost order for tests that can definitely return 0.0.
	private _distance = [_ai,_player] call CF_BAI_DETECT_FNC_get_distance;

	if ((_distance select 0) > 0.0) then {
		private _facing = [_ai,_player] call CF_BAI_DETECT_FNC_get_facing;

		if ((_facing select 0) > 0.0) then {
			private _raycast = [_ai,_player] call CF_BAI_DETECT_FNC_ray_cast;

			if ((_raycast select 0) > 0.0) then {
				[_distance,_facing,_raycast];
			} else {
				[_raycast];
			};
		} else {
			[_facing];
		};

	} else {
		[_distance];
	};

}else {
	[_knowledge];
};