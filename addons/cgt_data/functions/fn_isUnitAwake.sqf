/*
Description:
	Check if unit is down, with ace support

Parameters:
	<OBJECT> - The unit to check

Return:
    <BOOLEAN>

Example:
	[_unit] call LEON_COD_fnc_isUnitAwake;

*/
params ["_unit"];

//!(!alive _unit || (lifeState _unit == "INCAPACITATED" && incapacitatedState _unit == "UNCONSCIOUS") || !isNil "ace_common_fnc_isAwake" && { !([_unit] call ace_common_fnc_isAwake) })


!(!alive _unit || (lifeState _unit == "INCAPACITATED" && incapacitatedState _unit == "UNCONSCIOUS"))