class CfgPatches
{
	class LEON_CODGrenadeThrowback_cba_compats
	{
		author = "Leon";
		name = "COD Grenade Throwback - CBA Compats";
		requiredAddons[] = {
			"LEON_CODGrenadeThrowback",
			"cba_main"
		};
		requiredVersion = 2.14;
		units[] = {};
		weapons[] = {};
		skipWhenMissingDependencies = 1;
	};
};
class CfgFunctions
{
	class LEON_COD
	{
		class CODGreandeThrowback
		{
			class addGrenadeKeybind {
				file = "\leon\cod_grenade_throwback\cgt_cba_compats\fn_addGrenadeKeybind.sqf";
			};
			class addGrenadeSettings {
				file = "\leon\cod_grenade_throwback\cgt_cba_compats\fn_addGrenadeSettings.sqf";
			};
		};
	};
};
class Extended_PreInit_EventHandlers
{
	class cod_grenadeThrowback_keybind
	{
		clientInit = "0 spawn LEON_COD_fnc_addGrenadeKeybind;";
	};
	class cod_grenadeThrowback_settings
	{
		clientInit = "0 spawn LEON_COD_fnc_addGrenadeSettings;";
	};
};
