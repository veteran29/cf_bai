// cf_bai ArmA 3 Version 1.1

class CfgPatches
{
	class cf_bai
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {};
			version = "1.1";
			versionStr = "1.1";
			versionDesc="CFO_BAI";
			versionAr[] = {1,1};
			author = "BrightCandle";
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