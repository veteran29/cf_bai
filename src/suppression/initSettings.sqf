#include "script_component.hpp"

_categoryName="CF_BAI_suppression";

//disable

[   QGVAR(disableSuppression),"CHECKBOX",
    ["Disable Suppression Module","When enable all suppression functions will stop"],[_categoryName,"Enable"],
    false,true,{}
] call CBA_Settings_fnc_init;

//Suppression constants

[   QGVAR(bulletImpact),"SLIDER",
    ["Bullet Impact","The amount of suppression a bullet will impact on a unit"],[_categoryName,"Suppression"],
    [0.1,1.0,0.1,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(heldTime),"SLIDER",
    ["Time to maintain supression","When you stop firing how long will the suppression be maintained before it starts to decay"],[_categoryName,"Suppression"],
    [0,120,20,0],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(decay),"SLIDER",
    ["Supressive decay","10x this value per second is removed from the suppression"],[_categoryName,"Suppression"],
    [0.001,1.0,0.003,3],true,{}
] call CBA_Settings_fnc_init;

//Skills

[   QGVAR(spotDistance),"SLIDER",
    ["SpotDistance","The minimum multiplier for the base skill when fully suppressed"],[_categoryName,"Skills"],
    [0.01,2.0,0.5,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aimingAccuracy),"SLIDER",
    ["AimingAccuracy","The minimum multiplier for the base skill when fully suppressed"],[_categoryName,"Skills"],
    [0.01,2.0,0.2,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aimingSpeed),"SLIDER",
    ["AimingSpeed","The minimum multiplier for the base skill when fully suppressed"],[_categoryName,"Skills"],
    [0.01,2.0,0.2,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(reloadSpeed),"SLIDER",
    ["ReloadSpeed","The minimum multiplier for the base skill when fully suppressed"],[_categoryName,"Skills"],
    [0.01,2.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(commanding),"SLIDER",
    ["Commanding","The minimum multiplier for the base skill when fully suppressed"],[_categoryName,"Skills"],
    [0.01,2.0,0.20,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(spotTime),"SLIDER",
    ["SpotTime","The minimum multiplier for the base skill when fully suppressed"],[_categoryName,"Skills"],
    [0.01,2.0,0.50,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(courage),"SLIDER",
    ["Courage","The minimum multiplier for the base skill when fully suppressed"],[_categoryName,"Skills"],
    [0.01,2.0,0.20,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(aimingShake),"SLIDER",
    ["AimingShake","The minimum multiplier for the base skill when fully suppressed"],[_categoryName,"Skills"],
    [0.01,2.0,0.20,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(general),"SLIDER",
    ["General","The minimum multiplier for the base skill when fully suppressed"],[_categoryName,"Skills"],
    [0.01,2.0,0.5,2],true,{}
] call CBA_Settings_fnc_init;