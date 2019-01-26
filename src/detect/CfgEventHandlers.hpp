class Extended_PreInit_EventHandlers {
    class cf_bai_detect {
        init = "call compile preprocessFileLineNumbers '\x\cf_bai\addons\detect\XEH_preInit.sqf'";
        //init = "call compile preprocessFileLineNumbers 'XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers  {
    class cf_bai_detect {
        init = "call compile preprocessFileLineNumbers '\x\cf_bai\addons\detect\XEH_postInit.sqf'";
        //init = "call compile preprocessFileLineNumbers 'XEH_postInit.sqf'";
    };
};