#include "script_component.hpp"

INFO("Starting PostInit");

if (!isServer) exitWith {
	INFO("Client mode exiting");
};

INFO("Server mode - Starting players, ai, environment and vision threads");

[] spawn FUNC(playersThread);
[] spawn FUNC(aisThread);
[] spawn FUNC(environmentThread);
[] spawn FUNC(visionThread);