class CfgPatches
{
	class LEON_CODGrenadeThrowback
	{
		author = "Leon";
		name = "COD Grenade Throwback";
		requiredAddons[] = {"A3_Functions_F"};
		requiredVersion = 0.50;
		units[] = {};
		weapons[] = {};
	};
};
class CfgFunctions
{
	class LEON_COD
	{
		class CODGreandeThrowback
		{
			file = "\leon\cod_grenade_throwback\cgt_data\functions";
			class addEHKeybind {};
			class draw3DIcon
			{
				postInit = 1;
			};
			class isUnitAwake {};
			class onKeyDown {};
			class pickGrenade {};
			class preInit
			{
				preInit = 1;
			};
			class throwGrenade {};
		};
	};
};
