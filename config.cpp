// cf_bai ArmA 3 Version 1.2

class CfgPatches
{
	class cf_bai
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {};
			version = "1.2";
			versionStr = "1.2";
			versionDesc="CFO_BAI";
			versionAr[] = {1,2};
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