class CfgPatches
{
	class cf_bai_suppression
	{
		addonRootClass="A3_Characters_F";
		units[]={};
		weapons[]={};
		ammo[]={};
		requiredAddons[]=
		{
			"cf_bai_main"
		};
		requiredVersion=1.82;
		versionDesc="CF BAI ";
		versionAct="";
		version="1.0";
		versionStr="1.0";
		versionAr[]={1,0};
		author="BrightCandle";
		authors[]=
		{
			"BrightCandle"
		};
	};
};

class Extended_PreInit_EventHandlers
{
	cf_bai_suppression="call compile preProcessFileLineNumbers '\x\cf_bai\addons\suppression\XEH_preInit.sqf'";
};
class CfgVehicles
{
	class CAManBase;
	class SoldierWB: CAManBase
	{
		fsmSuppression="x\cf_bai\addons\suppresion\suppression.fsm";
	};
	class SoldierEB: CAManBase
	{
		fsmSuppression="x\cf_bai\addons\suppression\suppression.fsm";
	};
	class SoldierGB: CAManBase
	{
		fsmSuppression="x\cf_bai\addons\suppression\suppression.fsm";
	};
};
