#include "script_component.hpp"

class Extended_PreInit_EventHandlers {
    class CF_BAI_boost {
        init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\boost\XEH_preInit.sqf'";
    };
};

class Extended_FiredBIS_Eventhandlers {
    class CAManBase {
        class CF_BAI_boost {
            serverFired = "_this call FUNC(fired);";
        };
    };
};