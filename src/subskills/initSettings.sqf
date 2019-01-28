#include "script_component.hpp"

_categoryName="CF_BAI";

[   QGVAR(terrain_range),"SLIDER",
    ["Terrain range","How far the algorithm looks for vegetation, higher performs worse"],[_categoryName,"General"],
    [10,50,25,0],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(terrain_maximum_default),"SLIDER",
    ["Maximum terrain count","Once terrain in range equals this value it maxes the effect of skill reduction"],[_categoryName,"General"],
    [10,50,30,0],true,{}
] call CBA_Settings_fnc_init;

GVAR(terrain_maximum_world) = [["pja310",25],["Panthera3",25]];

[   QGVAR(terrain_maximum_world_code),"EDITBOX",
    ["Terrain count overrides", "Terrain specific overrides to the maximum default terain counts"],[_categoryName,"General"],
    format ["%1",GVAR(terrain_maximum_world)],true,
    {
        _code = QGVAR(terrain_maximum_world)+ " = " + _this;
        call compile _code;
    }
] call CBA_Settings_fnc_init;

[   QGVAR(sleep),"SLIDER",
    ["Initial Sleep time","CF BAI waits for this many seconds before starting to allow AI skill initialisation to occur, if using CF_BAI skills then this can be zero, ASR_AI requires ~30"],[_categoryName,"General"],
    [10,120,30,0],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(minimum_spotDistance),"SLIDER",
    ["Minimum percentage AI spotting subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[_categoryName,"Minimum Skill"],
    [0.01,1.0,0.35,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(minimum_aimingAccuracy),"SLIDER",
    ["Minimum percentage AI aiming accuracy subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[_categoryName,"Minimum Skill"],
    [0.01,1.0,0.41,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(minimum_aimingSpeed),"SLIDER",
    ["Minimum percentage AI aiming speed subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[_categoryName,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(minimum_reloadSpeed),"SLIDER",
    ["Minimum percentage AI reload speed subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[_categoryName,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(minimum_commanding),"SLIDER",
    ["Minimum percentage AI commanding subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[_categoryName,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(minimum_spotTime),"SLIDER",
    ["Minimum percentage AI spotTime subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[_categoryName,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(minimum_courage),"SLIDER",
    ["Minimum percentage AI courage subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[_categoryName,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(minimum_aimingShake),"SLIDER",
    ["Minimum percentage AI aiming shake subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[_categoryName,"Minimum Skill"],
    [0.01,1.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(minimum_general),"SLIDER",
    ["Minimum percentage AI general subskill","The percentage of the usual skill it will drop to when the most terrain objects is detected"],[_categoryName,"Minimum Skill"],
    [0.01,1.0,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(maximum_spotDistance),"SLIDER",
    ["Maximum AI spot distance subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[_categoryName,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(maximum_aimingAccuracy),"SLIDER",
    ["Maximum AI aiming accuracy subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[_categoryName,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(maximum_aimingSpeed),"SLIDER",
    ["Maximum AI aiming speed subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[_categoryName,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(maximum_reloadSpeed),"SLIDER",
    ["Maximum AI reload speed subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[_categoryName,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(maximum_commanding),"SLIDER",
    ["Maximum AI commanding subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[_categoryName,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(maximum_spotTime),"SLIDER",
    ["Maximum AI spot time subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[_categoryName,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(maximum_courage),"SLIDER",
    ["Maximum AI courage subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[_categoryName,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(maximum_aimingShake),"SLIDER",
    ["Maximum AI aiming shake subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[_categoryName,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(maximum_general),"SLIDER",
    ["Maximum AI general subskill","The normal skill the unit will have, a value of 0.0 means the skill wont be changed from the mission/addon settings"],[_categoryName,"Maximum Skill"],
    [0.00,1.0,0.0,2],true,{}
] call CBA_Settings_fnc_init;