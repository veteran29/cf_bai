class CfgPatches
{
	class CF_BAI_subskills
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {"CBA_MAIN"};
			requiredVersion=1.82;
			version = "1.3.2";
			versionStr = "1.3.2";
			versionDesc="CF_BAI_subskills";
			versionAr[] = {1,3,2};
			author = "BrightCandle";
			authors[]= {"BrightCandle"};
			url = "https://www.charliefoxtrotops.com";
		};
};

class CfgSettings {
   class CBA {
      class Versioning {
         class CF_BAI_subskills {
           	main_addon = "CF_BAI_main";

            class Dependencies {
               CBA[]={"cba_main", {3,6,0}, "true"};
            };
         };
      };
   };
};

#include "CfgEventHandlers.hpp"