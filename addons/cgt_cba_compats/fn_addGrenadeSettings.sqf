/*
Description:
	Add CBA keybind

Parameters:
	None

Return:
	None

Example:
	call LEON_COD_fnc_addGrenadeSettings;

*/

// Icon pick up inputbox
["LEON_COD_IconPickUp", "EDITBOX", ["Icon path", "Path of pick up icon"], ["COD Grenade Throwback", "Pick Up"], "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa"] call CBA_fnc_addSetting;
// Color 1 color
["LEON_COD_ColorPickUp", "COLOR", ["Color", "Color of pick up icon"], ["COD Grenade Throwback", "Pick Up"], [1, 1, 1, 1]] call CBA_fnc_addSetting;
// Size 1 slider
["LEON_COD_SizePickUp", "SLIDER", ["Size", "Size of icon"], ["COD Grenade Throwback", "Pick Up"], [0, 5, 1, 0]] call CBA_fnc_addSetting;

// Icon grenade inputbox
["LEON_COD_IconGrenade", "EDITBOX", ["Icon path", "Path of grenade icon"], ["COD Grenade Throwback", "Grenade"], "\leon\cod_grenade_throwback\cgt_data\icon\grenade.paa"] call CBA_fnc_addSetting;
// Color 2 color
["LEON_COD_ColorGrenade", "COLOR", ["Color", "Color of pick up icon"], ["COD Grenade Throwback", "Grenade"], [0.94, 0.24, 0.24, 1]] call CBA_fnc_addSetting;
// Size 2 slider
["LEON_COD_SizeGrenade", "SLIDER", ["Size", "Size of icon"], ["COD Grenade Throwback", "Grenade"], [0, 5, 1, 0]] call CBA_fnc_addSetting;
