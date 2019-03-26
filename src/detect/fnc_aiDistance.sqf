//a distance test is an array of guaranteed spot distance, distance to which drop off to zero, then guaranteed facing angle and facing angle drop off past which it is zero and finally a name
//for example eyes only is [300,1200,5,90]
//An optic might be [600,2400,2,2]
//we should also look vehicles to determine if they have 

CF_BAI_DETECT_FNC_eyeballs = {
    [300,1200,45,90,"eyeballs"];
};

CF_BAI_DETECT_FNC_bino = {
	params ["_ai"];
	private _binos = binocular _ai;

	private _result = objNull;

	if !( _binos isEqualTo "") then {
        //has binos
		_result = [600,4000,3.5,10,"bino"];
	};

	_result;
};

CF_BAI_DETECT_FNC_optics = {
	params ["_ai"];

	private _opticName = (primaryWeaponItems _ai) select 2;

	if !(isNil "_opticName" ||  {_opticName == ""}) then {
		private _modes = "true" configClasses (configfile >> "CfgWeapons" >> _opticName >> "ItemInfo" >> "OpticsModes");
		private _maxDistance =0;
        private _minDistance =0;
        private _maxZoom = 1;

        //TODO select the mode first
		{
			private _configMaxDistance = getNumber (configfile >> "CfgWeapons" >> _opticName >> "ItemInfo" >> "OpticsModes" >> (configName _x) >> "distanceZoomMax");
            _maxDistance = _configMaxDistance max _maxDistance;

            private _configMinDistance = getNumber (configfile >> "CfgWeapons" >> _opticName >> "ItemInfo" >> "OpticsModes" >> (configName _x) >> "distanceZoomMin");
            _minDistance = _configMinDistance max _minDistance;

            private _configZoomMax = getNumber (configfile >> "CfgWeapons" >> _opticName >> "ItemInfo" >> "OpticsModes" >> (configName _x) >> "opticsZoomMax");
            _maxZoom = _configZoomMax min _maxZoom;
		
		} forEach _modes;

        //then pull the values from it

        [_minDistance,_maxDistance*2,90 * _maxZoom,180 * _maxZoom];
	} else {
		objNull;
	};

};