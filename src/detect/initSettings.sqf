#include "script_component.hpp"

_categoryName="CF_BAI_detect";

[   QGVAR(disableDetect),"CHECKBOX",
    ["Disable Detect Module","When enabled all detect functions will stop"],[_categoryName,"Enable"],
    false,true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_standing_chance),"SLIDER",
    ["Player Visibility -Standing chance","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1.0,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_standing_knowledge),"SLIDER",
    ["Player Visibility -Standing knowledge","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1.0,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_crouch_chance),"SLIDER",
    ["Player Visibility -Crouch chance","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,0.5,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_crouch_knowledge),"SLIDER",
    ["Player Visibility -Crouch knowledge","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_prone_chance),"SLIDER",
    ["Player Visibility -Prone chance","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,0.1,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_prone_knowledge),"SLIDER",
    ["Player Visibility -Prone knowledge","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,1.0,2],true,{}
] call CBA_Settings_fnc_init;


[   QGVAR(playerVisibility_movement),"SLIDER",
    ["Player Visibility -Movement minimum value","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,0.5,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_movement_knowledge),"SLIDER",
    ["Player Visibility -Movement knowledge gained","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_movement_knowledge),"SLIDER",
    ["Player Visibility -Movement knowledge gained","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_terrain_count),"SLIDER",
    ["Player Visibility -Terrain count for foilage","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,10,4,0],true,{}
] call CBA_Settings_fnc_init;