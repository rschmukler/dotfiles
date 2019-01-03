static const char norm_fg[] = "#d7d2ce";
static const char norm_bg[] = "#04142C";
static const char norm_border[] = "#969390";

static const char sel_fg[] = "#d7d2ce";
static const char sel_bg[] = "#2d998c";
static const char sel_border[] = "#d7d2ce";

static const char urg_fg[] = "#d7d2ce";
static const char urg_bg[] = "#ff5260";
static const char urg_border[] = "#ff5260";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
