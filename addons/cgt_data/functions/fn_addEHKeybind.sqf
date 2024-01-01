/*
Description:
	Add Vanilla keybind

Parameters:
	None

Return:
	None

Example:
	call LEON_COD_fnc_addEHKeybind;
*/

if (!isNil "LEON_COD_keyDownID") exitWith {};

LEON_COD_keyDownID = (findDisplay 46) displayAddEventHandler ["KeyDown", {
	_handler = false;
	if ((_this select 1) in actionKeys "throw" && !LEON_COD_isACELoaded && (isNil "LEON_CBA_CODGrenadePickKey" || (!isNil "LEON_CBA_CODGrenadePickKey" && { !isNull (player getVariable ["LEON_COD_pickedGrenade", objNull]) }))) then {
		_handler = _this call LEON_COD_fnc_onKeyDown;
	};
	_handler
}];
