#define DOUBLES(var1,var2) var1##_##var2
#define QUOTE(var1) #var1
#define PATHTOF_SYS(var1,var2,var3) \x\##var1##\addons\##var2##\##var3
#define PATHTOF(var1) PATHTOF_SYS(CF_BAI,suppression,var1)
#define QPATHTOF(var1) QUOTE(PATHTOF(var1))
#define PATHTO_FNC(func) class func {\
    file = QPATHTOF(DOUBLES(fnc,func).sqf);\
    recompile = 0;\
}

class CfgFunctions {
    class CF_BAI {
        class Suppression {
            PATHTO_FNC(getSuppression);
        };
    };
};