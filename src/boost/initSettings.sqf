#include "script_component.hpp"

_categoryName="CF_BAI_boost";

[   QGVAR(disableBoost),"CHECKBOX",
    ["Disable Boost Module","When enabled all boost functions will stop"],[_categoryName,"Enable"],
    false,true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(bulletsToMaxBoost),"SLIDER",
    ["Bullets to Maximum Boost","How many bullets fired on a target position to get maximum boost"],[_categoryName,"Boost"],
    [1,10,3,0],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(maxBoost),"SLIDER",
    ["Maximum boost multiplier","The subs skills will at most be multiplied by this value"],[_categoryName,"Boost"],
    [0,5,1.50,2],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(toleranceRange),"SLIDER",
    ["Tolerance range","How far can the target move before the boost is stopped in metres"],[_categoryName,"Boost"],
    [1,100,50,0],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(targetChangeSleepTime),"SLIDER",
    ["Time to sleep to check target switches","Sleep time between checking if target boost should be stopped, impacts performance"],[_categoryName,"Boost"],
    [0.01,5,0.1,2],true,{}
] call CBA_Settings_fnc_init;

