/*
 * Description: This file contains vheicle types and unit types for most units spawned in the mission.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["HMMWV", "HMMWV_M2", "HMMWV_M2"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 *
 * Except for the classes specified in this file, classes are specified in the following files: CreateSearchChopper.sqf, EscapeSurprises (RUSSIANSEARCHCHOPPER) 
 * and RunExtraction.sqf, all in folder Scripts\Escape\.
 */
//onMapSingleClick "player setPos _pos; true;
private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

// Random array. Start position guard types.
drn_arr_Escape_StartPositionGuardTypes = ["USMC_Soldier", "USMC_Soldier2", "USMC_Soldier_Medic", "USMC_Soldier_SL", "USMC_Soldier_GL", "USMC_Soldier_TL"];

// Inner fence guard's secondary weapon (and corresponding magazine type).
drn_var_Escape_InnerFenceGuardSecondaryWeapon = "M9";
drn_var_Escape_InnerFenceGuardSecondaryWeaponMagazine = "15Rnd_9x19_M9";

// Random array. Civilian vehicle classes for ambient traffic. (Can also be set to a faction name).
drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = ["SkodaBlue", "SkodaGreen", "SkodaRed", "Skoda", "VWGolf", "TT650_Civ", "MMT_Civ", "hilux1_civil_2_covered", "hilux1_civil_1_open", "hilux1_civil_3_open", "car_hatchback", "datsun1_civil_1_open", "datsun1_civil_2_covered", "datsun1_civil_3_open", "V3S_Civ", "car_sedan", "Tractor", "UralCivil", "UralCivil2", "Lada_base", "LadaLM", "Lada2", "Lada1"];

// Random arrays. Enemy vehicle classes for ambient traffic. (Can also be set to a faction name).
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel", "LAV25", "LAV25_HQ", "M1126_ICV_M2_EP1", "M1128_MGS_EP1", "M1A1", "AAV", "M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel", "M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel", "M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel", "M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel"];
    };
    case 2: {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel", "LAV25", "LAV25_HQ", "M1126_ICV_M2_EP1", "M1128_MGS_EP1", "M1A1", "AAV", "M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel", "M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel"];
    };
    default {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel", "LAV25", "LAV25_HQ", "M1126_ICV_M2_EP1", "M1128_MGS_EP1", "M1A1", "AAV", "M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel", "LAV25", "LAV25_HQ", "M1126_ICV_M2_EP1", "M1128_MGS_EP1", "M1A1", "AAV", "M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel", "LAV25", "LAV25_HQ", "M1126_ICV_M2_EP1", "M1128_MGS_EP1", "M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "HMMWV_Ambulance", "HMMWV_Avenger", "Ural_ZU23_INS", "HMMWV_ambulance", "MtvrRefuel"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
drn_arr_Escape_InfantryTypes = ["USMC_Soldier_AA", "USMC_Soldier_AT", "USMC_Soldier_AT", "USMC_Soldier_AR", "USMC_Soldier_GL", "USMC_Soldier_MG", "USMC_Soldier_Medic", "USMC_Soldier", "USMC_Soldier2", "USMC_SoldierS_Sniper", "USMC_Soldier_AR", "USMC_Soldier_GL", "USMC_Soldier_MG", "USMC_Soldier_Medic", "USMC_Soldier", "USMC_Soldier2", "USMC_SoldierS_SniperH", "USMC_Soldier_AR", "USMC_Soldier_GL", "USMC_Soldier_MG", "USMC_Soldier_Medic", "USMC_Soldier", "USMC_Soldier", "USMC_SoldierS_Sniper", "USMC_Soldier_AR", "USMC_Soldier_GL", "USMC_Soldier_MG", "USMC_Soldier_Medic", "USMC_Soldier", "USMC_Soldier2", "USMC_SoldierS_Sniper", "USMC_Soldier_AR", "USMC_Soldier_GL", "USMC_Soldier_MG", "USMC_Soldier_Medic", "USMC_Soldier", "USMC_Soldier2", "USMC_SoldierS_Sniper"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
drn_arr_Escape_RoadBlock_MannedVehicleTypes = ["HMMWV", "HMMWV_M2", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored", "LAV25", "LAV25_HQ", "M1126_ICV_M2_EP1", "M1128_MGS_EP1", "M1A1", "AAV", "M2StaticMG", "MK19_TriPod", "M2StaticMG_US_EP1", "SPG9_Ins"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
drn_arr_Escape_ReinforcementTruck_vehicleClasses = ["MTVR", "MTVR"];
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_ReinforcementTruck_vehicleClasses above.
drn_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo = [14, 14];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
drn_arr_Escape_MotorizedSearchGroup_vehicleClasses = ["LAV25", "LAV25", "AAV", "HMMWV_M2"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
drn_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [7, 5, 7, 10];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_lightArmorClasses = ["LAV25", "M1126_ICV_M2_EP1", "LAV25", "AAV", "HMMWV_M2"];
// Random array. Heavy armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_heavyArmorClasses = ["M1A1", "AAV", "M6_EP1", "M1A2_TUSK_MG"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
drn_arr_ComCenStaticWeapons = ["MK19_TriPod"];
// A communication center have two parked and empty vehicles of the following possible types.
drn_arr_ComCenParkedVehicles = ["M1A2_TUSK_MG", "HMMWV", "HMMWV_M2", "MTVR", "MTVR", "MTVR", "MTVR", "MTVR", "HMMWV_TOW", "HMMWV_MK19", "HMMWV_Armored"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
drn_arr_Escape_EnemyCivilianCarTypes = ["SkodaBlue", "SkodaGreen", "SkodaRed", "Skoda", "VWGolf", "MMT_Civ", "hilux1_civil_2_covered", "car_hatchback", "datsun1_civil_2_covered", "V3S_Civ", "car_sedan", "UralCivil", "UralCivil2", "Lada_base", "LadaLM", "Lada2", "Lada1"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
drn_arr_Escape_AmmoDepot_StaticWeaponClasses = ["M2StaticMG_US_EP1", "M2StaticMG", "MK19_TriPod", "MK19_TriPod"];
// An ammo depot have one parked and empty vehicle of the following possible types.
drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = ["M1A1", "AAV", "M6_EP1", "M1A2_TUSK_MG"];
//Graydon: 1 parked and empty aircraft.
drn_arr_Escape_AmmoDepot_ParkedAircraftClasses = ["UH1Y", "M1A1", "AAV", "M6_EP1", "M1A2_TUSK_MG","LAV25", "LAV25", "AAV"];
// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box
drn_arr_AmmoDepotBasicWeapons = [];
// Insurgent weapons
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["M16A4", 30, 8, 12, ["30Rnd_556x45_Stanag"], 14]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["M16A4_ACG", 30, 8, 12, ["30Rnd_556x45_Stanag"], 14]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["M16A4_ACG_GL", 30, 8, 12, ["30Rnd_556x45_Stanag"], 14]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["G36C", 40, 8, 12, ["30Rnd_556x45_G36"], 12]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["G36K", 35, 2, 3, ["30Rnd_556x45_G36"], 15]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["DMR", 30, 1, 3, ["20Rnd_762x51_DMR"], 20]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["M4A1", 40, 3, 6, ["30Rnd_556x45_Stanag"], 12]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["M4A1_Aim", 40, 3, 6, ["30Rnd_556x45_Stanag"], 12]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["M24", 30, 2, 3, ["5Rnd_762x51_M24"], 15]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["MP5A5", 40, 8, 12, ["30Rnd_9x19_MP5"], 10]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["MP5SD", 30, 8, 12, ["30Rnd_9x19_MP5"], 10]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["M249", 30, 8, 12, ["200Rnd_556x45_M249"], 10]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["M1014", 40, 8, 12, ["8Rnd_B_Beneli_74Slug"], 10]];


// Weapons and ammo in the special weapons box
drn_arr_AmmoDepotSpecialWeapons = [];
// Insurgent weapons
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["M4A1_AIM_SD_camo", 20, 1, 2, ["30Rnd_556x45_Stanag"], 15]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["M4A1_HWS_GL", 20, 1, 2, ["30Rnd_556x45_Stanag"], 20]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["G36_C_SD_eotech", 20, 1, 2, ["30Rnd_556x45_G36SD"], 15]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["M4SPR", 20, 1, 2, ["20Rnd_556x45_Stanag"], 15]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["M8_sharpshooter", 20, 1, 1, ["30Rnd_556x45_G36"], 18]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["M40A3", 20, 1, 1, ["5Rnd_762x51_M24"], 18]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["M107", 20, 1, 1, ["10Rnd_127x99_m107"], 20]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["Mk_48", 20, 1, 1, ["100Rnd_762x51_M240"], 12]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["M240", 20, 2, 5, ["100Rnd_762x51_M240"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["SCAR_L_STD_EGLM_TWS", 5, 1, 1, ["30Rnd_556x45_StanagSD"], 12]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["m107_TWS_EP1", 20, 1, 1, ["10Rnd_127x99_m107"], 12]];

// Weapons and ammo in the launchers box
drn_arr_AmmoDepotLaunchers = [];
// Insurgent weapons
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["M136", 100, 3, 5, ["M136"], 2]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["SMAW", 100, 1, 2, ["SMAW_HEAA","SMAW_HEDP"], 2]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["Javelin", 100, 1, 1, ["Javelin"], 2]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["Stinger", 100, 1, 2, ["Stinger"], 2]];


// Weapons and ammo in the ordnance box
drn_arr_AmmoDepotOrdnance = [];
// General weapons
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Put", 50, 1, 2, ["Mine"], 5]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Put", 35, 1, 2, ["MineE"], 6]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 85, 1, 2, ["HandGrenade_West"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Put", 50, 1, 2, ["TimeBomb"], 2]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 75, 1, 2, ["SmokeShell"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellYellow"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellRed"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellGreen"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellPurple"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellBlue"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellOrange"], 8]];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
drn_arr_AmmoDepotVehicle = [];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Put", 30, 1, 1, ["Mine"], 100]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Throw", 30, 1, 2, ["HandGrenade_West"], 120]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Put", 30, 1, 2, ["TimeBomb"], 75]];

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.

drn_arr_CivilianCarWeapons = [];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["AK_74", "30Rnd_545x39_AK", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["AK_107_GL_PSO", "30Rnd_545x39_AK", 11]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["PK", "100Rnd_762x54_PK", 9]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Makarov", "8Rnd_9x18_Makarov", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["bizon", "64Rnd_9x19_Bizon", 6]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["SVD", "10Rnd_762x54_SVD", 7]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["AKS_74_PSO", "30Rnd_545x39_AK", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Huntingrifle", "5x_22_LR_17_HMR", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Bizon_Silenced", "64Rnd_9x19_SD_Bizon", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["MakarovSD", "8Rnd_9x18_MakarovSD", 12]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["RPG7V", "PG7V", 1]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["RPG18", "RPG18", 1]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Igla", "Igla", 1]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Put", "PipeBomb", 2]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Throw", "HandGrenade_East", 5]];
