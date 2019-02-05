class Extended_PreInit_EventHandlers {
    class CF_BAI_detect {
        init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\detect\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers  {
    class CF_BAI_detect {
        init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\detect\XEH_postInit.sqf'";
    };
};