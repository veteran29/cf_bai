class Extended_PostInit_EventHandlers {
    class Settings {
        init = "call compile preprocessFileLineNumbers '\x\cf_bai\addons\subskills\XEH_postInit.sqf'";
    };
};


class Extended_PreInit_EventHandlers {
    class Settings {
        init = "call compile preprocessFileLineNumbers '\x\cf_bai\addons\subskills\XEH_preInit.sqf'";
    };
};

/*class CfgFunctions
{
	class cf_bai
	{
		class init
		{
			class cf_bai_init
			{
				file ="cf_bai\cf_bai_init.sqf";
				postInit = 1;
			};
		};
	};
};*/