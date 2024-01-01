/*
Description:
	Draw 3D icon

Parameters:
	None

Return:
	None

Example:
	call LEON_COD_fnc_draw3DIcon;
*/

// if (isClass (configfile >> "CfgPatches" >> "ace_main")) exitWith {};
if (!isNil "LEON_COD_3DIconID") exitWith {};
if (isNil "LEON_COD_IconPickUp") then { LEON_COD_IconPickUp = "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa" };
if (isNil "LEON_COD_ColorPickUp") then { LEON_COD_ColorPickUp = [1, 1, 1, 1] };
if (isNil "LEON_COD_SizePickUp") then { LEON_COD_SizePickUp = 1 };

if (isNil "LEON_COD_IconGrenade") then { LEON_COD_IconGrenade = "\leon\cod_grenade_throwback\cgt_data\icon\grenade.paa" };
if (isNil "LEON_COD_ColorGrenade") then { LEON_COD_ColorGrenade = [0.94, 0.24, 0.24, 1] };
if (isNil "LEON_COD_SizeGrenade") then { LEON_COD_SizeGrenade = 1 };
LEON_COD_3DIconID = addMissionEventHandler ["Draw3D", {
	if (vehicle player == player && !isNil "LEON_COD_PickableGrenades" && {count LEON_COD_PickableGrenades > 0} && {[player] call LEON_COD_fnc_isUnitAwake && LEON_COD_PickableGrenades findIf { isNull (attachedTo _x) && alive _x && player distance _x <= 3 && vectorMagnitude velocity _x <= 10 && !lineIntersects [eyePos player, getPosASLVisual _x vectorAdd [0,0,(sizeOf (typeOf _x)) / 2], player, _x] } != -1 }) then {
		private _grenade = player getVariable ["LEON_COD_pickedGrenade", objNull];
		private _ACEgrenadeInHand = player getVariable ["ace_advanced_throwing_inHand", false];
		{
			_zoom = round ((([0.5, 0.5] distance2D (worldToScreen (positionCameraToWorld [0, 3, 2]))) * (getResolution select 5) / 2) * 10);
			_dir = round ([player, _x] call BIS_fnc_relativeDirTo);
			_dis = 3 / _zoom;
			_pos = [0,0,0];
			switch (true) do
			{
				case (_dir == 0):
				{
					_pos = [0, _dis, 2];
				};
				case (_dir == 90):
				{
					_pos = [_dis, 0, 2];
				};
				case (_dir == 180):
				{
					_pos = [0, -_dis, 2];
				};
				case (_dir == 270):
				{
					_pos = [-_dis, 0, 2];
				};
				default
				{
					if ((_dir > 90 && _dir < 180) || (_dir > 270 && _dir < 360)) then
					{
						_pos = [(cos (_dir % 90)) * _dis, (sin (_dir % 90)) * _dis, 2];
					} else {
						_pos = [(sin (_dir % 90)) * _dis, (cos (_dir % 90)) * _dis, 2];
					};
					if (_dir > 180) then { _pos set [0, (_pos select 0) * (-1)] };
					if (_dir > 90 && _dir < 270) then { _pos set [1, (_pos select 1) * (-1)] };
				};
			};
			_iconPos = positionCameraToWorld _pos;
			_texture = LEON_COD_IconGrenade;
			_color = LEON_COD_ColorGrenade;
			_size = LEON_COD_SizeGrenade;
			if (_forEachIndex == 0 && isNull _grenade && !_ACEgrenadeInHand) then
			{
				_texture = LEON_COD_IconPickUp;
				_color = LEON_COD_ColorPickUp;
				_size = LEON_COD_SizePickUp;
			};
			drawIcon3D [_texture, _color, _iconPos, _size, _size, 0, "", 2]; 
		} forEach LEON_COD_PickableGrenades;
	};
}];
