// tpwcas ArmA 3 Version 5.5 20140428

class CfgPatches
{
	class cf_bai
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {"CBA_Extended_EventHandlers"};
			version = "5.5";
			versionStr = "5.5";
			versionDesc="CFOAI";
			versionAr[] = {1,0};
			author[] = {"BrightCandle"};
		};
};

class Extended_PostInit_EventHandlers {
    class cf_bai_init {
		init = "if (isNil 'cf_bai_init') then { cf_bai_init = true;[] execVM '\cf_bai\init.sqf'};"; 
    };
}; 

class cf_bai_settings
{
	#include "\userconfig\cf_bai\ai_settings.hpp"
};
