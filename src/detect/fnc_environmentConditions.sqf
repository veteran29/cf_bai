CF_BAI_DETECT_FNC_day_night = {
	private _transitionState = sunOrMoon;

	// is 0 or 1, is it just more unlikely at night or should it adjust distance and other factors
	private _percentage = 0.5 + sunOrMoon/2;

	[_percentage,_percentage,"dayNight"];
};


//Uses rain level to reduce vision by 20% at worst
CF_BAI_DETECT_FNC_rain = {
	private _rainLevel = rain;

	private _reductionPercentage = 0.2;

	private _finalValue = 1 - (_reductionPercentage *_rainLevel); //0.8-1.0

	[_finalValue,_finalValue,"rain"];
};

//need to gather some hyristics for 0.25, 0.5 and 0.75 or maybe 10 values to see what the actual human vision is and then linear interpret
CF_BAI_DETECT_FNC_fog = {
	private _fog = fog;

	private _finalValue = 1 - (0.9 *_fog);

	[_finalValue,_finalValue,"fog"];
};

private _night = [] call CF_BAI_DETECT_FNC_day_night;
private _rain = [] call CF_BAI_DETECT_FNC_rain;
private _fog = [] call CF_BAI_DETECT_FNC_fog;

[_night,_rain,_fog];