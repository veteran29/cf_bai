#include "script_component.hpp"

private _name = worldName;

private _terrain_count = {
  if(_x select 0 == _name) exitWith {_x select 1;}

} forEach GVAR(terrain_maximum_world);

if( isNil "_terrain_count" ) then {
  GVAR(terrain_maximum_default);
} else {
  _terrain_count
};