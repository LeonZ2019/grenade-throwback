/*
Description:
	Throw picked grenade

Parameters:
	None

Return:
	<BOOLEAN>
	True if grenade throw success

Example:
	call LEON_COD_fnc_throwGrenade;

*/

private ["_grenade", "_success", "_up", "_dir", "_velocity", "_handOffset", "_handPos"];

_success = false;
if (!LEON_COD_isACELoaded) then {
	_grenade = player getVariable ["LEON_COD_pickedGrenade", objNull];
	if (!isNull _grenade) then {
		_up = getCameraViewDirection player;
		_dir = direction player;
		_velocity = velocity player;
		_handOffset = player selectionPosition ["RightHand", "Memory"];
		_handPos = player modelToWorld (_handOffset vectorAdd [0,0,0.5]);

		player playActionnow "ThrowGrenade";
		sleep 0.5;
		detach _grenade;
		player setVariable ["LEON_COD_pickedGrenade", objNull];

		_grenade setVectorUp _up;
		_grenade setDir _dir;
		_grenade setVelocity [(_velocity select 0) + (sin _dir * 16.5), (_velocity select 0) + (cos _dir * 16.5), (25.6623 * (_up select 2)) + 4.01847];
		_success = true;
	};
};
_success;
