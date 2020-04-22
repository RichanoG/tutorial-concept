#define FILTERSCRIPT

#define YSI_NO_HEAP_MALLOC
#define YSI_NO_OPTIMISATION_MESSAGE

#define MAX_CINEMATIC_SHOTS 100
#define MAX_TUTORIAL_TEXTDRAWS 100
#define MAX_TUTORIAL_CARS 100
#define MAX_TUTORIAL_BOTS 100
#define MAX_TUTORIAL_OBJECTS 100


// Worldid the tutorial contents (and the tutorial itself) will be visible in
#define TUTORIAL_WORLD (20)

#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))