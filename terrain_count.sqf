private _name = worldName;

private _terrain_count = {
  if(_x select 0 == _name) exitWith {_x select 1;}

} forEach cf_bai_terrain_maximum_world;

if( isNil "_terrain_count" ) then {
  cf_bai_terrain_maximum_default;
} else {
  _terrain_count
};