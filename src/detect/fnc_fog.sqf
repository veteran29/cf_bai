// takes two positions in ASL format;
params [["_pos0", [0,0,0], [[]], 3], ["_pos1", [0,0,0], [[]], 3]];

private _MaxViewDistance = 10000;
private _ViewDistanceDecayRate = 120;
private _z0 = _pos0 param [2, 0, [0]];
private _z1 = _pos1 param [2, 0, [0]];
private _l = _pos0 distance _pos1;

fogParams params ["_fogValue", "_fogDecay", "_fogBase"];

_fogValue = _fogValue min 1.0;
_fogValue = _fogValue max 0.0;
_fogDecay = _fogDecay min 1.0;
_fogDecay = _fogDecay max -1.0;
_fogBase = _fogBase min 5000;
_fogBase = _fogBase max -5000;
private _dz = _z1 - _z0;
private _fogCoeff = 1.0;
if (_dz !=0 && _fogDecay != 0) then {
	private _cl = -_fogDecay * _dz;
	private _d = -_fogDecay * (_z0 - _fogBase);
	// lim [(exp(x)-1) / x] = 1 as x->0
	if (abs(_cl) > 1e-4) then {
		_fogCoeff = exp(_d) * ( exp (_cl) - 1.0) / _cl;
	} else {
		_fogCoeff = exp(_d);
	}
};
private _fogAverage = _fogValue * _fogCoeff;
private _fogViewDistance = 0.9 * _MaxViewDistance * exp (- _fogAverage * ln(_ViewDistanceDecayRate));
0 max (1.0 - _l/_fogViewDistance);