#include "script_component.hpp"

params ["_unit","_skill", "_final_skill"];

private _tpwcas_skill_name = switch(_skill) do {
  case "aimingAccuracy": { "tpwcas_originalaccuracy" };
  case "aimingShake": { "tpwcas_originalshake" };
  case "courage": { "tpwcas_originalcourage" };
  default { "none" };
};

if(_tpwcas_skill_name == "none") then {
  _unit setskill [_skill,_final_skill];
} else {
  private _current_skill = _unit skill _skill;

  private _tpwcas_supstate = _unit getVariable ["tpwcas_supstate",0];

  private _tpw_original_skill = _unit getVariable [_tpwcas_skill_name,1.0];
  
  LOG_5("Unit:%1, Skill: %2, CurrentSkill: %3, TPWCAS_OriginalSkill: %4, TPWCAS_SupState: %5",_unit, _skill,_current_skill,_tpw_original_skill,_tpwcas_supstate);

  if(_tpwcas_supstate != 0) then {
	private _tpwcas_skill_multiplier = (_current_skill / _tpw_original_skill) min 0.999;

	_unit setVariable [_tpwcas_skill_name,_final_skill];
	_unit setskill [_skill,_final_skill * _tpwcas_skill_multiplier];
	
	LOG_2("Unit:%1, Multiplier:%2 - TPWCAS Active",_unit,_tpwcas_skill_multiplier);
  
} else {
  LOG_1("Unit:%1 - TPWCAS Not Active",_unit);

	_unit setVariable [_tpwcas_skill_name,_final_skill];
    _unit setskill [_skill,_final_skill];
  };

};