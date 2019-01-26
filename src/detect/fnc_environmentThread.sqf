#include "script_component.hpp"

while {true} do{
	private _conditions = [] call FUNC(environmentConditions);

	GVAR(environmentConditions) = _conditions;

	sleep 10;
};