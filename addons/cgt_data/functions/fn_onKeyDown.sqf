/*
Description:
	Actions for key

Parameters:
	None

Return:
	<BOOLEAN>
	True if correct key pressed

Example:
	call LEON_COD_fnc_onKeyDown;

*/

_handler = false;
if ([player] call LEON_COD_fnc_isUnitAwake) then {
	if (!isNull (player getVariable ["LEON_COD_pickedGrenade", objNull])) then {
		[] spawn LEON_COD_fnc_throwGrenade;
		_handler = true;
	} else {
		private _ACEgrenadeInHand = player getVariable ["ace_advanced_throwing_inHand", false];
		if (((isNil "LEON_CBA_CODGrenadePickKey" && {(_this select 2) == true}) || !isNil "LEON_CBA_CODGrenadePickKey") && !_ACEgrenadeInHand && count LEON_COD_PickableGrenades > 0) then {
			[player, LEON_COD_PickableGrenades select 0] spawn LEON_COD_fnc_pickGrenade;
			_handler = true;
		};
	};
};
_handler
