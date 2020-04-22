// Goes to the next cinematic in line (next CurrentPosition value)
SwitchCinematics(playerid) {
    CurrentPosition[playerid]++;
    PlayerPlaySound(playerid, 1056, 0,0,0);
    InterpolateCameraPos(playerid, CinematicShots[CurrentPosition[playerid]][FromX], CinematicShots[CurrentPosition[playerid]][FromY], CinematicShots[CurrentPosition[playerid]][FromZ], CinematicShots[CurrentPosition[playerid]][ToX], CinematicShots[CurrentPosition[playerid]][ToY], CinematicShots[CurrentPosition[playerid]][ToZ], 30000, CAMERA_MOVE);
    InterpolateCameraLookAt(playerid, CinematicShots[CurrentPosition[playerid]][FromLookX], CinematicShots[CurrentPosition[playerid]][FromLookY], CinematicShots[CurrentPosition[playerid]][FromLookZ], CinematicShots[CurrentPosition[playerid]][ToLookX], CinematicShots[CurrentPosition[playerid]][ToLookY], CinematicShots[CurrentPosition[playerid]][ToLookZ], 30000, CAMERA_MOVE);
    SetPlayerInterior(playerid, CinematicShots[CurrentPosition[playerid]][interiorid]);
    TextDrawSetString(Tutorial_Text[playerid], CinematicShots[CurrentPosition[playerid]][text]);
    if(CurrentPosition[playerid] - 1 == -1) {
        TextDrawShowForPlayer(playerid, Tutorial_Text[playerid]);  
        TextDrawShowForPlayer(playerid, Tutorial_Background);
        TextDrawShowForPlayer(playerid, Tutorial_Title);  
        TextDrawShowForPlayer(playerid, Tutorial_Continue);
    }
    return 1;
}

IsInCinematic(playerid) {
    if(CurrentPosition[playerid] > -1) {
        return true;
    }
    else {
        return false;
    }
}

IsCinematicValid(_cinematicid) {
    if(CinematicShots[_cinematicid][FromX] == 0 && CinematicShots[_cinematicid][FromLookX] == 0) {
        return false;
    }
    else {
        return true;
    }
}

GetCurrentPlayerCinematic(playerid) {
    return CurrentPosition[playerid];
}

RemovePlayerFromTutorial(playerid) {
    CurrentPosition[playerid] = -1;
    SetPVarInt(playerid, "Tutorial:IsPlayerRemovedFromTutorial", 1);
    TextDrawHideForPlayer(playerid, Tutorial_Background);
    TextDrawHideForPlayer(playerid, Tutorial_Title);  
    TextDrawHideForPlayer(playerid, Tutorial_Continue);
    TextDrawDestroy(Tutorial_Text[playerid]);
    TogglePlayerSpectating(playerid, 0);
    SetCameraBehindPlayer(playerid);
    return 1;
}

AddPlayerToTutorial(playerid) {
    new Float:OldX, Float:OldY, Float:OldZ;
    PreloadTutorialAnimLibs(playerid);
    GetPlayerPos(playerid, OldX, OldY, OldZ);
    SetPVarFloat(playerid, "Tutorial:OldX", OldX);
    SetPVarFloat(playerid, "Tutorial:OldY", OldY);
    SetPVarFloat(playerid, "Tutorial:OldZ", OldZ);
    SetPVarInt(playerid, "Tutorial:OldVW", GetPlayerVirtualWorld(playerid));
    SetPVarInt(playerid, "Tutorial:OldInt", GetPlayerInterior(playerid));
    SetPlayerVirtualWorld(playerid, TUTORIAL_WORLD);
    TogglePlayerSpectating(playerid, 1);
    CreatePlayerTutorialText(playerid);
    SwitchCinematics(playerid);
}

PreloadTutorialAnimLibs(playerid) {
    for(new i = 0; i < sizeof(TutorialAnimLibs); i++) {
        if(strlen(TutorialAnimLibs[i]) == 0) {
            return 1;
        }
        else {
            ApplyAnimation(playerid, TutorialAnimLibs[i], "null", 0.0, 0, 0, 0, 0, 0, 0);
        }
    }
    return 1;
}

AddTutorialAnimLib(_animlib[]) {
    for(new i = 0; i < sizeof(TutorialAnimLibs); i++) {
        if(!strcmp(TutorialAnimLibs[i], _animlib)) {
            if(strlen(TutorialAnimLibs[i]) == strlen(_animlib)) return 1;
        }
    }
    new idx = GetNewTutorialAnimLibIdx();
    format(TutorialAnimLibs[idx], 128, "%s", _animlib);
    return 1;
}

ClearTutorialAnimLib() {
    for(new i = 0; i < sizeof(TutorialAnimLibs); i++) {
        format(TutorialAnimLibs[i], 128, "");
    }
    return 1;
}

GetNewTutorialAnimLibIdx() {
    for(new i = 0; i < sizeof(TutorialAnimLibs); i++) {
        if(strlen(TutorialAnimLibs[i]) == 0) {
            return i;
        }
    }
    return 1;
}

// Creates the text TD for the player's tutorial session
CreatePlayerTutorialText(playerid) {

    Tutorial_Text[playerid] = TextDrawCreate(430.333068, 159.703781, "");
    TextDrawLetterSize(Tutorial_Text[playerid], 0.175666, 0.961184);
    TextDrawAlignment(Tutorial_Text[playerid], 1);
    TextDrawColor(Tutorial_Text[playerid], -1);
    TextDrawSetShadow(Tutorial_Text[playerid], 0);
    TextDrawSetOutline(Tutorial_Text[playerid], 1);
    TextDrawBackgroundColor(Tutorial_Text[playerid], 51);
    TextDrawFont(Tutorial_Text[playerid], 1);
    TextDrawSetProportional(Tutorial_Text[playerid], 1);
    return 1;
}

// Creates the normal textdraws (which won't be changed)
CreateTutorialTextdraws() {
    Tutorial_Title = TextDrawCreate(490.666870, 137.303741, "Tutorial");
    TextDrawLetterSize(Tutorial_Title, 0.449999, 1.600000);
    TextDrawAlignment(Tutorial_Title, 1);
    TextDrawColor(Tutorial_Title, -5963521);
    TextDrawSetShadow(Tutorial_Title, 0);
    TextDrawSetOutline(Tutorial_Title, 1);
    TextDrawBackgroundColor(Tutorial_Title, 51);
    TextDrawFont(Tutorial_Title, 3);
    TextDrawSetProportional(Tutorial_Title, 1);
    
    Tutorial_Background = TextDrawCreate(631.333374, 149.589019, "Background");
    TextDrawLetterSize(Tutorial_Background, 0.000000, 11.929814);
    TextDrawTextSize(Tutorial_Background, 418.333374, 0.000000);
    TextDrawAlignment(Tutorial_Background, 1);
    TextDrawColor(Tutorial_Background, 0);
    TextDrawUseBox(Tutorial_Background, true);
    TextDrawBoxColor(Tutorial_Background, 102);
    TextDrawSetShadow(Tutorial_Background, 0);
    TextDrawSetOutline(Tutorial_Background, 0);
    TextDrawFont(Tutorial_Background, 0);

    Tutorial_Continue = TextDrawCreate(486.333404, 245.985168, "Press ~b~LMB~w~ to continue.");
    TextDrawLetterSize(Tutorial_Continue, 0.199999, 0.969481);
    TextDrawAlignment(Tutorial_Continue, 1);
    TextDrawColor(Tutorial_Continue, -1);
    TextDrawSetShadow(Tutorial_Continue, 0);
    TextDrawSetOutline(Tutorial_Continue, 1);
    TextDrawBackgroundColor(Tutorial_Continue, 51);
    TextDrawFont(Tutorial_Continue, 1);
    TextDrawSetProportional(Tutorial_Continue, 1);
    return 1;
}

// Retrieves all the info stored inside the db
LoadCinematics() {
    td_db_handle = mysql_connect("localhost", "root", "", "cinematicdb");
    if(mysql_errno(td_db_handle) != 0)
        printf("[Textdraws][MySQL] Couldn't connect to the database (%d).", mysql_errno(td_db_handle));
    else
        printf("[Textdraws][MySQL] Connected to the database successfully (%d).", _:td_db_handle);
    inline OnCinematicTextReceived() {
        new rows;
        cache_get_row_count(rows);
        for(new i = 0; i < rows; i++) {
            new string_[256];
            cache_get_value_name(i, "text", string_);
            format(CinematicShots[i][text], 256, "%s", string_);
        }
    }
    MySQL_TQueryInline(td_db_handle, using inline OnCinematicTextReceived, "SELECT * FROM `cinematic_text_info`");
    inline OnCinematicPosReceived() {
        new rows;
        cache_get_row_count(rows);
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_float(i, "from_x", CinematicShots[i][FromX]);
            cache_get_value_name_float(i, "from_y", CinematicShots[i][FromY]);
            cache_get_value_name_float(i, "from_z", CinematicShots[i][FromZ]);
            cache_get_value_name_float(i, "to_x", CinematicShots[i][ToX]);
            cache_get_value_name_float(i, "to_y", CinematicShots[i][ToY]);
            cache_get_value_name_float(i, "to_z", CinematicShots[i][ToZ]);
            cache_get_value_name_int(i, "time", CinematicShots[i][time]);
            cache_get_value_name_int(i, "interior_id", CinematicShots[i][interiorid]);
        }
    }
    MySQL_TQueryInline(td_db_handle, using inline OnCinematicPosReceived, "SELECT * FROM `cinematic_pos_info`");
    inline OnCinematicLookatReceived() {
        new rows;
        cache_get_row_count(rows);
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_float(i, "from_x", CinematicShots[i][FromLookX]);
            cache_get_value_name_float(i, "from_y", CinematicShots[i][FromLookY]);
            cache_get_value_name_float(i, "from_z", CinematicShots[i][FromLookZ]);
            cache_get_value_name_float(i, "to_x", CinematicShots[i][ToLookX]);
            cache_get_value_name_float(i, "to_y", CinematicShots[i][ToLookY]);
            cache_get_value_name_float(i, "to_z", CinematicShots[i][ToLookZ]);
        }
    }
    MySQL_TQueryInline(td_db_handle, using inline OnCinematicLookatReceived, "SELECT * FROM `cinematic_lookat_info`");
    inline OnCinematicBotInfoReceived() {
        new rows, tmp[128];
        cache_get_row_count(rows);
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "cinematic_id", CinematicBotInfo[i][cinematicid]);
            cache_get_value_name_int(i, "model_id", CinematicBotInfo[i][modelid]);
            cache_get_value_name_float(i, "pos_x", CinematicBotInfo[i][PosX]);
            cache_get_value_name_float(i, "pos_y", CinematicBotInfo[i][PosY]);
            cache_get_value_name_float(i, "pos_z", CinematicBotInfo[i][PosZ]);
            cache_get_value_name_float(i, "angle", CinematicBotInfo[i][Angle]);
            cache_get_value_name_int(i, "interior_id", CinematicBotInfo[i][interiorid]);
            cache_get_value_name(i, "anim_lib", tmp);
            format(CinematicBotInfo[i][animlib], 128, "%s", tmp);
            AddTutorialAnimLib(CinematicBotInfo[i][animlib]);
            cache_get_value_name(i, "anim_name", tmp);
            format(CinematicBotInfo[i][animname], 128, "%s", tmp);
            cache_get_value_name_int(i, "loop", CinematicBotInfo[i][loop]);
            cache_get_value_name_int(i, "lock_x", CinematicBotInfo[i][lockx]);
            cache_get_value_name_int(i, "lock_y", CinematicBotInfo[i][locky]);
            cache_get_value_name_int(i, "freeze", CinematicBotInfo[i][freeze]);
            cache_get_value_name_int(i, "time", CinematicBotInfo[i][time]);
            CinematicBotInfo[i][actor] = CreateDynamicActor(CinematicBotInfo[i][modelid], CinematicBotInfo[i][PosX], CinematicBotInfo[i][PosY], CinematicBotInfo[i][PosZ], CinematicBotInfo[i][Angle], 1, 100.0, TUTORIAL_WORLD, CinematicBotInfo[i][interiorid], -1, 300.00);
            if(strlen(CinematicBotInfo[i][animlib]) != 0 || strlen(CinematicBotInfo[i][animname]) != 0) {
               ApplyDynamicActorAnimation(CinematicBotInfo[i][actor], CinematicBotInfo[i][animlib], CinematicBotInfo[i][animname], 4.1, CinematicBotInfo[i][loop], CinematicBotInfo[i][lockx], CinematicBotInfo[i][locky], CinematicBotInfo[i][freeze], CinematicBotInfo[i][time]);
            }
        }
    }
    MySQL_TQueryInline(td_db_handle, using inline OnCinematicBotInfoReceived, "SELECT * FROM `cinematic_bot_info`");
    inline OnCinematicCarInfoReceived() {
        new rows;
        cache_get_row_count(rows);
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "cinematic_id", CinematicCarInfo[i][cinematicid]);
            cache_get_value_name_int(i, "model_id", CinematicCarInfo[i][modelid]);
            cache_get_value_name_float(i, "pos_x", CinematicCarInfo[i][PosX]);
            cache_get_value_name_float(i, "pos_y", CinematicCarInfo[i][PosY]);
            cache_get_value_name_float(i, "pos_z", CinematicCarInfo[i][PosZ]);
            cache_get_value_name_float(i, "angle", CinematicCarInfo[i][Angle]);
            cache_get_value_name_int(i, "color_1", CinematicCarInfo[i][color1]);
            cache_get_value_name_int(i, "color_2", CinematicCarInfo[i][color2]);
            cache_get_value_name_int(i, "interior_id", CinematicCarInfo[i][interiorid]);
            CinematicCarInfo[i][vehicle] = CreateVehicle(CinematicCarInfo[i][modelid], CinematicCarInfo[i][PosX], CinematicCarInfo[i][PosY], CinematicCarInfo[i][PosZ], CinematicCarInfo[i][Angle], CinematicCarInfo[i][color1], CinematicCarInfo[i][color2], -1, 0);
            LinkVehicleToInterior(CinematicCarInfo[i][vehicle], CinematicCarInfo[i][interiorid]);
            SetVehicleVirtualWorld(CinematicCarInfo[i][vehicle], TUTORIAL_WORLD);
        }
    }
    MySQL_TQueryInline(td_db_handle, using inline OnCinematicCarInfoReceived, "SELECT * FROM `cinematic_car_info`");
    inline OnCinematicObjInfoReceived() {
        new rows;
        cache_get_row_count(rows);
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "cinematic_id", CinematicObjInfo[i][cinematicid]);
            cache_get_value_name_int(i, "model_id", CinematicObjInfo[i][modelid]);
            cache_get_value_name_float(i, "pos_x", CinematicObjInfo[i][PosX]);
            cache_get_value_name_float(i, "pos_y", CinematicObjInfo[i][PosY]);
            cache_get_value_name_float(i, "pos_z", CinematicObjInfo[i][PosZ]);
            cache_get_value_name_float(i, "rotate_x", CinematicObjInfo[i][RotX]);
            cache_get_value_name_float(i, "rotate_y", CinematicObjInfo[i][RotY]);
            cache_get_value_name_float(i, "rotate_z", CinematicObjInfo[i][RotZ]);
            cache_get_value_name_int(i, "interior_id", CinematicObjInfo[i][interiorid]);
            CinematicObjInfo[i][object] = CreateDynamicObject(CinematicObjInfo[i][modelid], CinematicObjInfo[i][PosX], CinematicObjInfo[i][PosY], CinematicObjInfo[i][PosZ], CinematicObjInfo[i][RotX], CinematicObjInfo[i][RotY], CinematicObjInfo[i][RotZ], TUTORIAL_WORLD, CinematicObjInfo[i][interiorid], -1, 300.00, 300.00);
        }
    }
    MySQL_TQueryInline(td_db_handle, using inline OnCinematicObjInfoReceived, "SELECT * FROM `cinematic_obj_info`");
    CreateTutorialTextdraws();
}

// Resets some server variables related to the system (Advised to only use this when reloading the system as it doesn't reset all variables)
UnloadCinematics() {
    foreach(new i : Player) {
        if(IsInCinematic(i)) {
           RemovePlayerFromTutorial(i); 
        }
    }
    TextDrawDestroy(Tutorial_Title);
    TextDrawDestroy(Tutorial_Background);
    TextDrawDestroy(Tutorial_Continue);
    for(new i; i < MAX_TUTORIAL_BOTS; i++) {
        DestroyDynamicActor(CinematicBotInfo[i][actor]);
    }
    for(new i; i < MAX_TUTORIAL_CARS; i++) {
        DestroyVehicle(CinematicCarInfo[i][vehicle]);
    }
    for(new i; i < MAX_TUTORIAL_OBJECTS; i++) {
        DestroyDynamicObject(CinematicObjInfo[i][object]);
    }
    ClearTutorialAnimLib();
    mysql_close(td_db_handle);
    return 1;
}

