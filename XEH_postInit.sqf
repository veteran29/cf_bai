#include "script_macros.hpp"

if (not isServer ) exitWith {
  diag_log text "[CF_BAI] In client mode";
};

diag_log text "[CF_BAI] In server mode";

[] execVM "x\cf_bai\addons\subskills\fnc_subskills.sqf";
