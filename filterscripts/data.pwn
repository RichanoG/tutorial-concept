enum tShotInfo {
    text[256],
    Float:FromX,
    Float:FromY,
    Float:FromZ,
    Float:ToX,
    Float:ToY,
    Float:ToZ,
    Float:FromLookX,
    Float:FromLookY,
    Float:FromLookZ,
    Float:ToLookX,
    Float:ToLookY,
    Float:ToLookZ,
    time,
    interiorid
}

enum tBotInfo {
    cinematicid, // Not used at the moment, but useful for the future.
    modelid,
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    Float:Angle,
    interiorid,
    animlib[128],
    animname[128],
    loop,
    lockx,
    locky,
    freeze,
    time,
    actor
}

enum tCarInfo {
    cinematicid, // Not used at the moment, but useful for the future.
    vehicle,
    modelid,
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    Float:Angle,
    color1,
    color2,
    interiorid
}

enum tObjInfo {
    cinematicid, // Not used at the moment, but useful for the future.
    object,
    modelid,
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    Float:RotX,
    Float:RotY,
    Float:RotZ,
    interiorid
}


new MySQL:td_db_handle;

new CinematicBotInfo[MAX_TUTORIAL_BOTS][tBotInfo];
new CinematicCarInfo[MAX_TUTORIAL_CARS][tCarInfo];
new CinematicObjInfo[MAX_TUTORIAL_OBJECTS][tObjInfo];
new CinematicShots[MAX_CINEMATIC_SHOTS][tShotInfo];
new TutorialAnimLibs[MAX_TUTORIAL_BOTS][128];


new Text:Tutorial_Text[MAX_TUTORIAL_TEXTDRAWS];
new Text:Tutorial_Background;
new Text:Tutorial_Title;
new Text:Tutorial_Continue;

new CurrentPosition[MAX_PLAYERS] = -1;

