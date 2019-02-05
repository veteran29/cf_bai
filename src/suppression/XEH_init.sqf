#include "script_component.hpp"

params ["_unit"];

LOG_2("Type of unit %1 is %2",_unit,typeof _unit);

if !(isPlayer _unit) then  {
	[_unit] spawn FUNC(updateSuppression);
};