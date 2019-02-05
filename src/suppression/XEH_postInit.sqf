#include "script_component.hpp"

if (not isServer ) exitWith {
  INFO("In client mode");
};

 INFO("In server mode");