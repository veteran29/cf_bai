#include "script_component.hpp"

if (not isServer ) exitWith {
  INFO("In client mode");
};

 INFO("In server mode");

[] execVM "x\cf_bai\addons\subskills\fnc_updateUnits.sqf";
