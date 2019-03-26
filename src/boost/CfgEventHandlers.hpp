class Extended_PreInit_EventHandlers {
    class CF_BAI_boost {
        init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\boost\XEH_preInit.sqf'";
    };
};

class Extended_InitPost_EventHandlers {
    class CAManBase {
        class CF_BAI_boost {
            init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\boost\XEH_postInit.sqf'";
        };
    };
};
