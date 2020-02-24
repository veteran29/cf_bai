#include "script_component.hpp"

_categoryName="CF_BAI_detect";

[   QGVAR(disableDetect),"CHECKBOX",
    ["Disable Detect Module","When enabled all detect functions will stop"],
    _categoryName,
    false,true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(overall_visibility_multiplier),"SLIDER",
    ["Overall Visibility","Adjusts the final chance of the spotting, 1.0 is no change, 0.5 is half as likely, 2.0 is twice as likely"],
    _categoryName,
    [0.5,2.0,1.0,1],true,{}
] call CBA_Settings_fnc_init;

//ai to player vision tests
[   QGVAR(aiplayervision_max_distance),"SLIDER",
    ["Max Distance","The maximum distance the detect routines will use, is adjusted by the units spotting skill"],
    [_categoryName,"AI_PlayerVision"],
    [300,2000,1200,0],true,{}
] call CBA_Settings_fnc_init;


//Player Vision Tests
[   QGVAR(playerVisibility_standing_chance),"SLIDER",
    ["Standing chance","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1.0,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_standing_knowledge),"SLIDER",
    ["Standing knowledge","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1.0,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_crouch_chance),"SLIDER",
    ["Crouch chance","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,0.5,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_crouch_knowledge),"SLIDER",
    ["Crouch knowledge","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_prone_chance),"SLIDER",
    ["Prone chance","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,0.1,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_prone_knowledge),"SLIDER",
    ["Prone knowledge","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,1.0,2],true,{}
] call CBA_Settings_fnc_init;


[   QGVAR(playerVisibility_movement),"SLIDER",
    ["Movement minimum value","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,0.5,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_movement_knowledge),"SLIDER",
    ["Movement knowledge gained","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_movement_knowledge),"SLIDER",
    ["Movement knowledge gained","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,1,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(playerVisibility_terrain_count),"SLIDER",
    ["Terrain count for foilage","Vision Test for player stance"],
    [_categoryName,"PlayerVisibility"],
    [0,10,4,0],true,{}
] call CBA_Settings_fnc_init;

//Environment Conditions Vision Tests
[   QGVAR(environmentConiditions_nightTime),"SLIDER",
    ["Day and Night","Night time percentage, day time is always 1.0"],
    [_categoryName,"EnvironmentConditions"],
    [0,1.0,0.5,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(environmentConiditions_rain),"SLIDER",
    ["Rain","Rain reduction percentage at most, clear will always be 1.0"],
    [_categoryName,"EnvironmentConditions"],
    [0,1.0,0.2,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(environmentConiditions_fog),"SLIDER",
    ["Fog","Fog reduction percentage at most, clear will always be 1.0"],
    [_categoryName,"EnvironmentConditions"],
    [0,1.0,0.9,2],true,{}
] call CBA_Settings_fnc_init;


//AI Vision Tests
[   QGVAR(aivision_careless_chance),"SLIDER",
    ["Careless chance","The chance in awareness careless that AI will spot"],
    [_categoryName,"AIVision"],
    [0,1.0,0.5,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_careless_knowledge),"SLIDER",
    ["Careless knowledge","The knowledge amount the AI would gain if he spotted"],
    [_categoryName,"AIVision"],
    [0,1.0,0.5,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_safe_chance),"SLIDER",
    ["Safe chance","The chance in awareness safe that AI will spot"],
    [_categoryName,"AIVision"],
    [0,1.0,0.75,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_safe_knowledge),"SLIDER",
    ["Safe knowledge","The knowledge amount the AI would gain if he spotted"],
    [_categoryName,"AIVision"],
    [0,1.0,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_aware_chance),"SLIDER",
    ["Aware chance","The chance in awareness aware that AI will spot"],
    [_categoryName,"AIVision"],
    [0,1.0,0.9,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_aware_knowledge),"SLIDER",
    ["Aware knowledge","The knowledge amount the AI would gain if he spotted"],
    [_categoryName,"AIVision"],
    [0,1.0,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_combat_chance),"SLIDER",
    ["Combat chance","The chance in awareness combat that AI will spot"],
    [_categoryName,"AIVision"],
    [0,1.0,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_combat_knowledge),"SLIDER",
    ["Combat knowledge","The knowledge amount the AI would gain if he spotted"],
    [_categoryName,"AIVision"],
    [0,1.0,1.0,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_stealth_chance),"SLIDER",
    ["Stealth chance","The chance in awareness stealth that AI will spot"],
    [_categoryName,"AIVision"],
    [0,1.0,0.75,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_stealth_knowledge),"SLIDER",
    ["Stealth knowledge","The knowledge amount the AI would gain if he spotted"],
    [_categoryName,"AIVision"],
    [0,1.0,0.75,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_nobino_chance),"SLIDER",
    ["No Binocular chance","If he AI has no binoculars chance"],
    [_categoryName,"AIVision"],
    [0,1.0,0.75,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_nobino_knowledge),"SLIDER",
    ["No Binocular knowledge","If he AI has no binoculars knowledge gained if spotted"],
    [_categoryName,"AIVision"],
    [0,1.0,0.75,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_nooptics_chance),"SLIDER",
    ["No Optics chance","If the AI has no optics vision test chance"],
    [_categoryName,"AIVision"],
    [0,1.0,0.5,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_nooptics_knowledge),"SLIDER",
    ["No Optics knowledge","If the AI has no optics vision test knowledge"],
    [_categoryName,"AIVision"],
    [0,1.0,0.5,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_nooptics_range),"SLIDER",
    ["No Optics range","The range below which the no optics values apply"],
    [_categoryName,"AIVision"],
    [0,2000,400,0],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_optics_range),"SLIDER",
    ["Optics range","The range at which optics are sufficient for full chance and knowledge"],
    [_categoryName,"AIVision"],
    [0,2000,1500,0],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aivision_nvg_percentage),"SLIDER",
    ["NVGs","The chance and knowledge if no NVGs are found and its night time"],
    [_categoryName,"AIVision"],
    [0,1.0,0.25,2],true,{}
] call CBA_Settings_fnc_init;