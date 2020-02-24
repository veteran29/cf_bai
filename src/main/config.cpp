class CfgPatches
{
	class CF_BAI_main
		{
			name = "CF_BAI_main";
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {};
			requiredVersion = 1.88;
			version = "2.0.alpha4";
			versionStr = "2.0.alpha4";
			versionDesc="CF_BAI";
			versionAr[] = {2,0,0};
			versionDesc="CF_BAI";
			author = "BrightCandle";
			authors[]= {"BrightCandle"};
			url = "https://www.charliefoxtrotops.com";
		};
};

class CfgSettings {
   class CBA {
      class Versioning {
         class CF_BAI {
				class Dependencies {
               CBA[]={"cba_main", {3,9,0}, "true"};
            };
         };
      };
   };
};

#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"