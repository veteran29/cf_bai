#include "script_component.hpp"

params ["_ai"];

CF_BAI_DETECT_FNC_awareness ={
	params ["_ai"];

	private _awareness = behaviour _ai;

	private _name = "awareness";
	private _result = [1.0,1.0];
	switch (_awareness) do {
		case "CARELESS":{ _result = [GVAR(aivision_careless_chance),QGVAR(aivision_careless_knowledge),_name]; };
		case "SAFE":{ _result = [QGVAR(aivision_safe_chance),GVAR(aivision_safe_knowledge),_name]; };
		case "AWARE":{ _result = [GVAR(aivision_aware_chance),GVAR(aivision_aware_knowledge),_name]; };
		case "COMBAT":{ _result = [GVAR(aivision_combat_chance),GVAR(aivision_combat_knowledge),_name]; };
		case "STEALTH":{ _result = [GVAR(aivision_stealth_chance),GVAR(aivision_stealth_knowledge),_name]; };
		default { _result = [1.0,1.0,_name]; };
	};

	_result;
};


CF_BAI_DETECT_FNC_bino = {
	params ["_ai"];
	private _binos = binocular _ai;

	private _result = [GVAR(aivision_nobino_chance),GVAR(aivision_nobino_knowledge),"bino"];

	if !( _binos isEqualTo "") then {
		_result = [1.0,1.0,"bino"];
	};

	_result;
};

CF_BAI_DETECT_FNC_optics = {
	params ["_ai"];

	private _opticName = (primaryWeaponItems _ai) select 2;

	if !(isNil "_opticName" ||  {_opticName == ""}) then {
		private _modes = "true" configClasses (configfile >> "CfgWeapons" >> _opticName >> "ItemInfo" >> "OpticsModes");
		private _maxDistance =0;

		{
			private _distance = getNumber (configfile >> "CfgWeapons" >> _opticName >> "ItemInfo" >> "OpticsModes" >> (configName _x) >> "distanceZoomMax");

			_maxDistance = _distance max _maxDistance;
		
		} forEach _modes;

		//0 is for the nooptics chance and knowledge, 1.0 is for 1.0
		private _opticPercentage = ( ( (_maxDistance - GVAR(aivision_nooptics_range)) / (GVAR(aivision_optics_range) - GVAR(aivision_nooptics_range)) ) min 1.0 max 0.0);

		private _chance = GVAR(aivision_nooptics_chance) + ( (1.0 - GVAR(aivision_nooptics_chance)) * _opticPercentage);

		private _knowledge = GVAR(aivision_nooptics_knowledge) + ( (1.0 - GVAR(aivision_nooptics_knowledge)) * _opticPercentage);

		[_chance,_knowledge,"optics"];
	} else {
		[GVAR(aivision_nooptics_chance),GVAR(aivision_nooptics_knowledge),"optics"];
	};

};

//NVGoggles, NVGoggles_OPFOR, NVGoggles_INDEP, Integrated_NVG_F, Integrated_NVG_TI_0_F, Integrated_NVG_TI_1_F
CF_BAI_DETECT_FNC_nightvision = {
	params ["_ai"];

	private _percentage = 1.0;
	private _isDay = sunOrMoon; // 0 is moon
	if (_isDay ==0) then {
		private _nvgs= hmd _ai;
		if (_nvgs == "") then {
			_percentage = GVAR(aivision_nvg_percentage);
		} else {
			_percentage = 1.0;
		};
	};
	[_percentage,_percentage,"nightVision"];
};

CF_BAI_DETECT_FNC_spotTime = {
	params ["_ai"];

	private _spotTime = _ai skillFinal "spotTime";

	[_spotTime,1.0,"spotTime"];
};

private _aiAwareness = [_ai] call CF_BAI_DETECT_FNC_awareness;
private _binos = [_ai] call CF_BAI_DETECT_FNC_bino;
private _optics = [_ai] call CF_BAI_DETECT_FNC_optics;
private _nightVision = [_ai] call CF_BAI_DETECT_FNC_nightvision;
private _spotTime = [_ai] call CF_BAI_DETECT_FNC_spotTime;

[_aiAwareness,_binos,_optics,_nightVision,_spotTime];