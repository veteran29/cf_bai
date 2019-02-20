set MAKE=%ARMAKE%

set BUILD=build
set MOD=%BUILD%\@CF_BAI
set ADDONS=%MOD%\addons
set KEYS=%MOD%\keys

del /Q /S %BUILD%

mkdir %BUILD%
mkdir %MOD%
mkdir %ADDONS%
mkdir %KEYS%

copy README %MOD%
copy LICENSE %MOD%
copy mod.cpp %MOD%

copy keys\\cf_bai.bikey %KEYS%

%MAKE% build -k keys/cf_bai.biprivatekey -s %ADDONS%\cf_bai_main.pbo src/main %ADDONS%\cf_bai_main.pbo
%MAKE% build -k keys/cf_bai.biprivatekey -s %ADDONS%\cf_bai_subskills.pbo src/subskills %ADDONS%\cf_bai_subskills.pbo
%MAKE% build -k keys/cf_bai.biprivatekey -s %ADDONS%\cf_bai_detect.pbo src/detect %ADDONS%\cf_bai_detect.pbo
%MAKE% build -k keys/cf_bai.biprivatekey -s %ADDONS%\cf_bai_suppression.pbo src/suppression %ADDONS%\cf_bai_suppression.pbo
REM %MAKE% build -k keys/cf_bai.biprivatekey -s %ADDONS%\cf_bai_boost.pbo src/suppression %ADDONS%\cf_bai_boost.pbo