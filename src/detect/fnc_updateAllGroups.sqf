params ["_additionalTime"];

private _opforGroups=[];
private _blueforGroups=[];
private _resistanceGroups=[];

//determine the various groups
{
	private _group = _x;
	switch (side _group) do {
		case west: { _blueforGroups append _group };
    	case east: { _opforGroups append _group };
		case resistance: { _resistanceGroups append _group };
	};

} forEach allGroups;

//west sees resistance and east

{
	private _lookingGroup = _x;
	private _lookingLeader = leader _lookingGroup;

	if (!isPlayer _lookingLeader && alive _lookingLeader) then {
		{
			private _seenGroup = _x;
			private _seenLeader = leader _seenGroup;
			if(alive _seenLeader) then {
				private _couldSee = [_lookingLeader,_seenLeader] call FUNC(groupVisionTest);
				if(_couldSee) then {
					{
						private _lookiungUnit = _x;
						{
							[_lookiungUnit,_x,10+_additionalTime] call FUNC(updateKnowsAbout);
						} forEach units _seenGroup;
						
					} forEach units _lookingGroup;
				};
			};
		} forEach _opforGroups+_resistanceGroups;
	};
} forEach _blueforGroups;

//east sees west and resistance

//resistance sees east and west


//  --- TODO ----
//Need a test for if a group is cohesive or we test all units.
//needs a simple group to group rule out test, otherwises check all units in group to see all units in corresponding groups