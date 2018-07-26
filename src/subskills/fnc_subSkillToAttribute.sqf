params ["_skill"];

switch(_skill) do {
  case "aimingAccuracy": { "CF_BAI_DEFAULT_AIMING_ACCURACY" };
  case "aimingSpeed": { "CF_BAI_DEFAULT_AIMING_SPEED" };
  case "aimingShake": { "CF_BAI_DEFAULT_AIMING_SHAKE" };
  case "commanding": { "CF_BAI_DEFAULT_COMMANDING" };
  case "spotDistance": { "CF_BAI_DEFAULT_SPOT_DISTANCE" };
  case "spotTime": { "CF_BAI_DEFAULT_SPOT_TIME" };
  case "courage": { "CF_BAI_DEFAULT_COURAGE" };
  case "general": { "CF_BAI_DEFAULT_GENERAL" };
  default { "none" };
};
