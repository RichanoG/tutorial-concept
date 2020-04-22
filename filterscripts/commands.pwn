CMD:tutorial(playerid, params[]) {
    AddPlayerToTutorial(playerid);
    return 1;
}

CMD:reloadtutorial(playerid, params[]) {
    foreach(new i : Player) {
        SendClientMessage(i, -1, "{FF0000}Server: {FFFFFF}Tutorial cinematics are being reloaded, please stand by..");
    }
    UnloadCinematics();
    LoadCinematics();
    return 1;
}


CMD:showplayerdata(playerid, params[]) {
    new string[128];
    format(string, sizeof(string), "Debug: CurrentPosition = %d | VirtualWorld = %d | Interior = %d", CurrentPosition[playerid], GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    SendClientMessage(playerid, -1, string);
    SendClientMessage(playerid, -1, "Debug: Preloaded tutorial animation libraries:");
    for(new i = 0; i < sizeof(TutorialAnimLibs); i++) {
        if(strlen(TutorialAnimLibs[i]) == 0) return 1;
        SendClientMessage(playerid, -1, TutorialAnimLibs[i]);
    }
    return 1;
}