/*
Description:
	Add CBA keybind

Parameters:
	None

Return:
	None

Example:
	call LEON_COD_fnc_addGrenadeKeybind;

*/
if (!isNil "LEON_COD_keyDownID") then {
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", LEON_COD_keyDownID];
};

_shiftCtrlAlt = if (isClass (configfile >> "CfgPatches" >> "ace_main")) then {
	[true, true, false];
} else {
	[true, false, false];
};

LEON_CBA_CODGrenadePickKey = ["Grenade Throwback", "COD_Grenade_Throwback", ["Pick Up Grenade", "Pick Up Grenade"], { _this call LEON_COD_fnc_onKeyDown }, {}, [34, _shiftCtrlAlt]] call CBA_fnc_addKeybind;
