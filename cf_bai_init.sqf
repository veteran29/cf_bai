#define QUOTE(var1) #var1
#define CF_BAI_SETDEFAULT(var,def) if (isNil QUOTE(var)) then {var = def}; diag_log formatText ["[CF_BAI] %1 = %2", QUOTE(var),var];

if not ( isServer ) exitWith {
  diag_log text "[CF_BAI] In client mode";
};

diag_log text "[CF_BAI] In server mode";

if(isFilePatchingEnabled) then {
	CF_BAI_SETTINGS = compile preprocessFileLineNumbers "\userconfig\cf_bai\cf_bai_settings.sqf";
	
	if (!isNil "CF_BAI_SETTINGS") then {
		diag_log text "[CF_BAI] Config file loaded";
		[] call CF_BAI_SETTINGS;
	} else {
		diag_log text "[CF_BAI] WARNING - Config file not found, using defaults";
	};

} else {
	diag_log text "[CF_BAI] WARNING - filepatching needs to be set to enable loading the config file, using defaults";
};

CF_BAI_SETDEFAULT(cf_bai_terrain_range,25);
CF_BAI_SETDEFAULT(cf_bai_terrain_maximum_count,30);

CF_BAI_SETDEFAULT(cf_bai_minimum_spotDistance,0.35);
CF_BAI_SETDEFAULT(cf_bai_minimum_aimingAccuracy,0.41);
CF_BAI_SETDEFAULT(cf_bai_minimum_aimingSpeed,0.50);
CF_BAI_SETDEFAULT(cf_bai_minimum_commanding,0.50);
CF_BAI_SETDEFAULT(cf_bai_minimum_spotTime,0.50);
CF_BAI_SETDEFAULT(cf_bai_minimum_courage,1.0);
CF_BAI_SETDEFAULT(cf_bai_minimum_aimingShake,1.0);
CF_BAI_SETDEFAULT(cf_bai_minimum_general,1.0);

CF_BAI_SETDEFAULT(cf_bai_maximum_spotDistance,-1.0);
CF_BAI_SETDEFAULT(cf_bai_maximum_aimingAccuracy,-1.0);
CF_BAI_SETDEFAULT(cf_bai_maximum_aimingSpeed,-1.0);
CF_BAI_SETDEFAULT(cf_bai_maximum_commanding,-1.0);
CF_BAI_SETDEFAULT(cf_bai_maximum_spotTime,-1.0);
CF_BAI_SETDEFAULT(cf_bai_maximum_courage,-1.0);
CF_BAI_SETDEFAULT(cf_bai_maximum_aimingShake,-1.0);
CF_BAI_SETDEFAULT(cf_bai_maximum_general,-1.0);

CF_BAI_SETDEFAULT(cf_bai_debug_logging,0);
if (cf_bai_debug_logging!=0) then {
  cf_bai_debug_logging =true;
} else {
  cf_bai_debug_logging =false;
};

diag_log formatText ["[CF_BAI] Debug logging is set to %1", cf_bai_debug_logging];

CF_BAI_FNC_setskill_tpwcas = compile preprocessFileLineNumbers "cf_bai\setskill.sqf";

sleep 30;

[] execVM "\cf_bai\spotting.sqf";