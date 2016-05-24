if not ( isServer ) exitWith {
  diag_log text "[CF_BAI] In client mode";
};

diag_log text "[CF_BAI] In server mode";

cf_bai_terrain_range = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_terrain_range");
cf_bai_terrain_maximum_count = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_terrain_maximum_count");

diag_log formatText ["[CF_BAI] Terrain Range is %1", cf_bai_terrain_range];
diag_log formatText ["[CF_BAI] Maximum terrain count is %1", cf_bai_terrain_maximum_count];

cf_bai_minimum_spot_distance = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_minimum_spot_distance");
diag_log formatText ["[CF_BAI] Minimum spot distance is set to %1", cf_bai_minimum_spot_distance];

cf_bai_minimum_aiming_accuracy = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_minimum_aiming_accuracy");
diag_log formatText ["[CF_BAI] Minimum spot accuracy is set to %1", cf_bai_minimum_aiming_accuracy];

cf_bai_minimum_aiming_speed = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_minimum_aiming_speed");
diag_log formatText ["[CF_BAI] Minimum Aiming speed is set to %1", cf_bai_minimum_aiming_speed];

cf_bai_minimum_commanding = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_minimum_commanding");
diag_log formatText ["[CF_BAI] Minimum Commanding is set to %1", cf_bai_minimum_commanding];

cf_bai_minimum_spot_time = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_minimum_spot_time");
diag_log formatText ["[CF_BAI] Minimum Spot time is set to %1", cf_bai_minimum_spot_time];

cf_bai_minimum_courage = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_minimum_courage");
diag_log formatText ["[CF_BAI] Minimum Courage time is set to %1", cf_bai_minimum_courage];

cf_bai_minimum_aiming_shake = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_minimum_aiming_shake");
diag_log formatText ["[CF_BAI] Minimum Aiming Shake time is set to %1", cf_bai_minimum_aiming_shake];

_debug_logging = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_debug_logging");
if (_debug_logging!=0) then {
  cf_bai_debug_logging =true;
} else {
  cf_bai_debug_logging =false;
};

diag_log formatText ["[CF_BAI] Debug logging is set to %1", cf_bai_debug_logging];


[] execVM "\cf_bai\spotting.sqf";