#include "script_component.hpp"

params ["_ai"];

CF_BAI_DETECT_FNC_awareness ={
	params ["_ai"];

	private _awareness = behaviour _ai;

	private _name = "awareness";
	private _result = [1.0,1.0];
	switch (_awareness) do {
		case "CARELESS":{ _result = [0.5,0.5,_name]; };
		case "SAFE":{ _result = [0.75,1.0,_name]; };
		case "AWARE":{ _result = [0.9,1.0,_name]; };
		case "COMBAT":{ _result = [1.0,1.0,_name]; };
		case "STEALTH":{ _result = [0.75,0.75,_name]; };
		default { _result = [1.0,1.0,_name]; };
	};

	_result;
};


CF_BAI_DETECT_FNC_bino = {
	params ["_ai"];
	private _binos = binocular _ai;

	private _result = [0.75,0.75,"bino"];

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

		private _opticPercentage = 1 - ( ((_maxDistance-400) / (1500-400)) min 1.0 max 0.0);

		private _probability = 1 - (0.5 * _opticPercentage);//between 0.5 and 1.0

		[_probability,_probability,"optics"];
	} else {
		[0.5,0.5,"optics"];
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
			_percentage = 0.25;
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