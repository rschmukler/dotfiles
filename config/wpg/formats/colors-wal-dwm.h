static const char norm_fg[] = "#f2f9fd";
static const char norm_bg[] = "#14162f";
static const char norm_border[] = "#232653";

static const char sel_fg[] = "#f2f9fd";
static const char sel_bg[] = "#5736eb";
static const char sel_border[] = "#f2f9fd";

static const char urg_fg[] = "#f2f9fd";
static const char urg_bg[] = "#e840af";
static const char urg_border[] = "#e840af";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
