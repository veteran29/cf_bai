#include "script_component.hpp"

params ["_unit","_boost"];

["CF_BAI_boost",_unit,"aimingAccuracy",_boost] call CF_BAI_fnc_setSkillParameter;
["CF_BAI_boost",_unit,"aimingShake",_boost] call CF_BAI_fnc_setSkillParameter;
["CF_BAI_boost",_unit,"aimingSpeed",_boost] call CF_BAI_fnc_setSkillParameter;
