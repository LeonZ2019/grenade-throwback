/*
Description:
	Initial for Grenade throwback

Parameters:
	None

Return:
	None

Example:
	None

*/
if (!hasInterface) exitWith {};
LEON_COD_isACELoaded = (isClass (configfile >> "CfgPatches" >> "ace_main"));

LEON_COD_PickableGrenades = [];

[] spawn {
	waitUntil { !isNull (findDisplay 46) };
	call LEON_COD_fnc_addEHKeybind;
	while {true} do {
		private _grenades = [];
		waitUntil {sleep 0.1; _grenades = (nearestObjects [player, ["GrenadeHand", "IRStrobeBase"], 3]); vehicle player == player && _grenades findIf {isNull (attachedTo _x) && vectorMagnitude velocity _x <= 10} != -1};
		if ([player] call LEON_COD_fnc_isUnitAwake) then {
			_aceGrenade = player getVariable ["ace_advanced_throwing_activeThrowable", objNull];
			LEON_COD_PickableGrenades = _grenades select { isNull (attachedTo _x) && vectorMagnitude velocity _x <= 5 && !lineIntersects [eyePos player, getPosASLVisual _x vectorAdd [0,0,(sizeOf (typeOf _x)) / 2], player, _x] && (!LEON_COD_isACELoaded || (LEON_COD_isACELoaded && { _x != _aceGrenade })) };
		};
	};
};