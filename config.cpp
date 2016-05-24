// cf_bai ArmA 3 Version 1.0

class CfgPatches
{
	class cf_bai
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {};
			version = "1.0";
			versionStr = "1.0";
			versionDesc="CFO_BAI";
			versionAr[] = {1,0};
			author[] = {"BrightCandle"};
		};
};

class CfgFunctions
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
};

class cf_bai_settings
{
	#include "\userconfig\cf_bai\ai_settings.hpp"
};
