﻿// Search Chopper v1.0
// Author: Engima of Östgöta Ops

if (!isServer) exitWith {};

private ["_chopper", "_searchAreaMarker", "_searchTimeMin", "_refuelTimeMin", "_debug", "_group", "_side", "_state", "_exitScript", "_position", "_waypoint", "_moveOutTimeSek", "_refuelStartTimeSek"];
private ["_oldGroup", "_homePos"];

_chopper = _this select 0;
_searchAreaMarker = _this select 1;
_searchTimeMin = _this select 2;
_refuelTimeMin = _this select 3;
if (count _this > 4) then {_debug = _this select 4;} else {_debug = false;};

if (isNil "drn_var_commonLibInitialized") exitWith {
	private ["_message"];
	_message = "Scripts\DRN\CommonLib\CommonLib.sqf must be called before call to Scripts/DRN/SearchChopper/SearchChopper.sqf.";
	player sideChat _message;
	diag_log _message;
};

_group = group _chopper;
_side = side leader _group;
_state = "READY";
_homePos = getPos _chopper;

if (_debug) then {
    player sideChat "Starting search chopper script...";
};

if (vehicleVarName _chopper == "") exitWith {
	sleep 5;
	player sideChat "Search chopper must have a name. Script exiting.";
};

while {!([_searchAreaMarker] call drn_fnc_CL_MarkerExists)} do {
	sleep 1;
};

_exitScript = false;

while {!_exitScript} do {
	switch (_state) do {
		case "READY": {
			_state = "MOVING OUT";
			_moveOutTimeSek = diag_tickTime;

			if (_debug) then {
				player sideChat "Search chopper state: MOVING OUT.";
			};

			_chopper flyInHeight 100;
			_chopper setVariable ["waypointFulfilled", false];
			
			_chopper engineOn true;
			_chopper move [position _chopper select 0, position _chopper select 1, 85];
			while {(position _chopper) select 2 < 75} do {
				sleep 1;
			};

			_position = [_searchAreaMarker] call drn_fnc_CL_GetRandomMarkerPos;

			_waypoint = _group addWaypoint [_position, 0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "NORMAL";
			_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""waypointFulfilled"", true];"];

			if (_debug) then {
				"SmokeShellBlue" createVehicle _position;
			};
		};
		case "SEARCHING": {
			if (_debug) then {
				player sideChat "Search chopper state: SEARCHING.";
			};

			_chopper setVariable ["waypointFulfilled", false];

			_position = [_searchAreaMarker] call drn_fnc_CL_GetRandomMarkerPos;
			_waypoint = _group addWaypoint [_position, 0];
			_waypoint setWaypointType "SAD";
			_waypoint setWaypointBehaviour "COMBAT";
			_waypoint setWaypointSpeed "LIMITED";
			_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""waypointFulfilled"", true];"];

			_chopper flyInHeight 100;

			if (_debug) then {
				"SmokeShellRed" createVehicle _position;
			};
		};
		case "RETURNING": {
			if (_debug) then {
				player sideChat "Search chopper state: RETURNING.";
			};

			_oldGroup = _group;
			_group = createGroup _side;
			{[_x] joinSilent _group;} foreach units _oldGroup;
			deleteGroup _oldGroup;

			_chopper setVariable ["waypointFulfilled", false];

			_waypoint = _group addWaypoint [_homePos, 0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "NORMAL";
			_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""waypointFulfilled"", true];"];

			if (_debug) then {
				"SmokeShellBlue" createVehicle _homePos;
			};

			_chopper flyInHeight 100;
		};
		case "LANDING": {
			if (_debug) then {
				player sideChat "Search chopper state: LANDING.";
			};

			_chopper land "LAND";
			_chopper setVariable ["waypointFulfilled", false];
		};
		case "REFUELING": {
			// Do nothing
		};
		case "DEAD": {
			if (_debug) then {
				player sideChat "Search chopper state: DEAD.";
			};
		};
		default {
			player sideChat "ERROR IN SearchChopper.sqf: Case " + _state + " not taken care of (1st switch)!";
		};
	};

	while {1 == 1} do {

		// Check to see if chopper is still alive
		if (!alive _chopper) exitWith {
			_state = "DEAD";
			_exitScript = true;
		};

		// Check if current waypoint is fulfilled
		if (_chopper getVariable "waypointFulfilled") exitWith {

			switch (_state) do {
				case "MOVING OUT": {
					_state = "SEARCHING";
				};
				case "SEARCHING": {
					_state = "SEARCHING";
				};
				case "RETURNING": {
					_state = "LANDING";
				};
				default {
					player sideChat "ERROR IN SearchChopper.sqf: Case " + _state + " not taken care of (2nd switch)!";
				};
			};
		};

		if (_state == "LANDING") exitWith {
			_state = "REFUELING";
			if (_debug) then {
				player sideChat "Search chopper state: REFUELING.";
			};

			_refuelStartTimeSek = diag_tickTime;
			_chopper setFuel 1;
		};

		if (_state == "REFUELING") exitWith {
//			player sideChat "Tick time == " + str diag_tickTime + " AND right side == " + str (_refuelStartTimeSek + (_refuelTimeMin * 60));
			if (diag_tickTime > _refuelStartTimeSek + (_refuelTimeMin * 60)) then {
				_state = "READY";
			};
		};

		// Check if search time is up
		if ((diag_tickTime > _moveOutTimeSek + (_searchTimeMin * 60)) && (_state == "SEARCHING" || _state == "MOVING OUT")) exitWith {
			_state = "RETURNING";
		};

		sleep 1;
	};

	sleep 2;
};

if (_exitScript) then {
	if (_debug) then {
		player sideChat "Search chopper unable to continue. Script exiting.";
	};
};

