public OnFilterScriptInit() {
    LoadCinematics();
    return 1;
}

public OnFilterScriptExit() {
    UnloadCinematics();
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if(PRESSED(KEY_FIRE)) {
        if(IsInCinematic(playerid)) {
            if(!IsCinematicValid(GetCurrentPlayerCinematic(playerid) + 1)) {
                RemovePlayerFromTutorial(playerid);
            }
            else {
                SwitchCinematics(playerid);
            }
        }
	}
    if(PRESSED(KEY_SECONDARY_ATTACK)) {
        if(IsInCinematic(playerid)) {
            RemovePlayerFromTutorial(playerid);
        }
    }
	return 1;
}

public OnPlayerConnect(playerid) {
    CurrentPosition[playerid] = -1;
    return 1;
}

public OnPlayerSpawn(playerid) {
    if(GetPVarInt(playerid, "Tutorial:IsPlayerRemovedFromTutorial") == 1) {
        SetPlayerPos(playerid, GetPVarFloat(playerid, "Tutorial:OldX"), GetPVarFloat(playerid, "Tutorial:OldY"), GetPVarFloat(playerid, "Tutorial:OldZ"));
        SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "Tutorial:OldVW"));
        SetPlayerInterior(playerid, GetPVarInt(playerid, "Tutorial:OldInt"));
        SetPVarInt(playerid, "Tutorial:IsPlayerRemovedFromTutorial", 0);
    }
    return 1;
}

public OnPlayerDisconnect(playerid, reason) {
    RemovePlayerFromTutorial(playerid);
    return 1;
}