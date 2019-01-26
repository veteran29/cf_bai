class CfgPatches
{
	class cf_bai
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {"CBA_MAIN"};
			requiredVersion=1.82;
			version = "1.3.2";
			versionStr = "1.3.2";
			versionDesc="CF_BAI";
			versionAr[] = {1,3,2};
			author = "BrightCandle";
			authors[]= {"BrightCandle"};
			url = "https://www.charliefoxtrotops.com";
		};
};

class CfgSettings {
   class CBA {
      class Versioning {
         class cf_bai {
           	main_addon = "cf_bai";

            class Dependencies {
               CBA[]={"cba_main", {3,6,0}, "true"};
            };
         };
      };
   };
};

#include "CfgEventHandlers.hpp"