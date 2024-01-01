/*
Description:
	Pick up grenade

Parameters:
	<OBJECT> - The unit which gonna pick up grenade
    <OBJECT> - The grenade

Return:
    None

Example:
	[_unit, _grenade] call LEON_COD_fnc_pickGrenade;

*/

params ["_unit", "_grenade"];
if (LEON_COD_isACELoaded) then {
	_unit setVariable ["ace_advanced_throwing_lastThrownTime", CBA_missionTime];
	_grenade setVariable ["ace_advanced_throwing_throwable", _grenade];
	[_grenade, _unit] call ace_advanced_throwing_fnc_pickUp;
	_unit setVariable ["ace_advanced_throwing_lastThrownTime", -1];
} else {
	// player playActionNow "putDown";
	// sleep 0.2;
	[_grenade, clientOwner] remoteExec ["setOwner", 0];
	_grenade attachTo [_unit, [-0.06,-0.04,0.045], "righthand", true];
	_unit setVariable ["LEON_COD_pickedGrenade", _grenade];
};
