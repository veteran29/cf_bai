#define CATEGORY_NAME "CF_BAI"

[   "cf_bai_terrain_range","SLIDER",
    ["Terrain range","How far the algorithm looks for vegetation, higher performs worse"],[CATEGORY_NAME,"General"],
    [10,50,25,0],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_terrain_maximum_default","SLIDER",
    ["Maximum terrain count","Once terrain in range equals this value it maxes the effect of skill reduction"],[CATEGORY_NAME,"General"],
    [10,50,30,0],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_terrain_maximum_world_code","EDITBOX",
    ["Terrain count overrides", "Terrain specific overrides to the maximum default terain counts"],[CATEGORY_NAME,"General"],
    "[[""pja310"",25],[""Panthera3"",25]]",true,
    {
        _code = "cf_bai_terrain_maximum_world = " + _this;
        call compile _code;
    }
] call CBA_Settings_fnc_init;

[   "cf_bai_sleep","SLIDER",
    ["Initial Sleep time","CF BAI waits for this many seconds before starting to allow AI skill initialisation to occur, if using CF_BAI skills then this can be zero, ASR_AI requires ~30"],[CATEGORY_NAME,"General"],
    [10,120,30,0],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_minimum_spotDistance","SLIDER",
    ["Minimum percentage AI spotting subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[CATEGORY_NAME,"Minimum Skill"],
    [0.01,1.0,0.35,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_minimum_aimingAccuracy","SLIDER",
    ["Minimum percentage AI aiming subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[CATEGORY_NAME,"Minimum Skill"],
    [0.01,1.0,0.41,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_minimum_aimingSpeed","SLIDER",
    ["Minimum percentage AI aiming subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[CATEGORY_NAME,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_minimum_commanding","SLIDER",
    ["Minimum percentage AI commanding subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[CATEGORY_NAME,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_minimum_spotTime","SLIDER",
    ["Minimum percentage AI spotTime subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[CATEGORY_NAME,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_minimum_courage","SLIDER",
    ["Minimum percentage AI courage subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[CATEGORY_NAME,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_minimum_aimingShake","SLIDER",
    ["Minimum percentage AI aiming shake subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[CATEGORY_NAME,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_minimum_general","SLIDER",
    ["Minimum percentage AI general subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[CATEGORY_NAME,"Minimum Skill"],
    [0.01,1.0,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_maximum_spotDistance","SLIDER",
    ["Maximum AI spot distance subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[CATEGORY_NAME,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_maximum_aimingAccuracy","SLIDER",
    ["Maximum AI aiming accuracy subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[CATEGORY_NAME,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_maximum_aimingSpeed","SLIDER",
    ["Maximum AI aiming speed subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[CATEGORY_NAME,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_maximum_commanding","SLIDER",
    ["Maximum AI commanding subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[CATEGORY_NAME,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_maximum_spotTime","SLIDER",
    ["Maximum AI spot time subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[CATEGORY_NAME,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_maximum_courage","SLIDER",
    ["Maximum AI courage subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[CATEGORY_NAME,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_maximum_aimingShake","SLIDER",
    ["Maximum AI aiming shake subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[CATEGORY_NAME,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   "cf_bai_maximum_general","SLIDER",
    ["Maximum AI general subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[CATEGORY_NAME,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;