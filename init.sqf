if not ( isServer ) then 
{
  diag_log text "[CF_BAI] In client mode";
  exit;
};

diag_log text "[CF_BAI] In server mode";

cf_bai_minimum_spot = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_minimum_spot");
cf_bai_terrain_range = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_terrain_range");
cf_bai_terrain_maximum_count = getNumber(configFile>> "cf_bai_settings"  >> "cf_bai_terrain_maximum_count");

diag_log formatText ["[CF_BAI] Minimum spot is set to %1", cf_bai_minimum_spot];
diag_log formatText ["[CF_BAI] Terrain Range is %1", cf_bai_terrain_range];
diag_log formatText ["[CF_BAI] Maximum terrain count is %1", cf_bai_terrain_maximum_count];


[] execVM "\cf_bai\spotting.sqf";