/* See LICENSE file for copyright and license details. */

/*scripts*/
static const char *cmusnext[] = { "/home/aldo/.local/bin/cm", "-l", NULL};
static const char *cmusprev[] = { "/home/aldo/.local/bin/cm", "-h", NULL};
static const char *cmusvi[] = { "/home/aldo/.local/bin/cm", "-k", NULL};
static const char *cmusvd[] = { "/home/aldo/.local/bin/cm", "-j", NULL};
static const char *playpause[] = { "/home/aldo/.local/bin/cm", "-p", NULL};
static const char *clipboardss[] = { "/home/aldo/.local/bin/ss.sh", "-s", NULL};
static const char *save_ss_as[] = { "/home/aldo/.local/bin/ss.sh", "-a", NULL};
static const char *snapshot[] = { "/home/aldo/.local/bin/ss.sh", "-z", NULL};
static const char *dclipboardss[] = { "/home/aldo/.local/bin/ss.sh", "-x", NULL};
static const char *pb_clipboard[] = { "/home/aldo/.local/bin/pb", "-c", NULL};
static const char *pb[] = { "/home/aldo/.local/bin/pb", "-p", NULL};
static const char *sr[] = { "/home/aldo/.local/bin/sr", "", NULL};
static const char *lt[] = { "/home/aldo/.local/bin/lt", "", NULL};
static const char *rd[] = { "/home/aldo/.local/bin/rd", "", NULL};
static const char *conet[] = { "/home/aldo/.local/bin/conet", "", NULL};
static const char *mount[] = { "/home/aldo/.local/bin/mt", "", NULL};
static const char *pm[] = { "/home/aldo/.local/bin/pm", "", NULL};
static const char *calcurse[] = { "/home/aldo/.local/bin/super", "-c", NULL};
static const char *lf[] = { "/home/aldo/.local/bin/super", "-e", NULL};
static const char *firefox[] = { "/home/aldo/.local/bin/super", "-f", NULL};
static const char *cmus[] = { "/home/aldo/.local/bin/super", "-m", NULL};
static const char *newsboat[] = { "/home/aldo/.local/bin/super", "-n", NULL};
static const char *elaunch[] = { "/home/aldo/.local/bin/el", "", NULL};
static const char *n64[] = { "/home/aldo/.local/bin/64", "", NULL};
static const char *lo[] = { "/home/aldo/.local/bin/lo", "", NULL};
static const char *ff[] = { "/home/aldo/.local/bin/ff", "", NULL};
static const char *fd[] = { "/home/aldo/.local/bin/fd", "", NULL};
static const char *fr[] = { "/home/aldo/.local/bin/fr", "", NULL};
static const char *bm[] = { "/home/aldo/.local/bin/bm", "", NULL};
static const char *surf[] = { "/home/aldo/.local/bin/super", "-s", NULL};
static const char *teams[] = { "/home/aldo/.local/bin/super", "-t", NULL};
static const char *vim[] = { "/home/aldo/.local/bin/super", "-v", NULL};
static const char *ytfzf[] = { "/home/aldo/.local/bin/super", "-y", NULL};
static const char *ib[] = { "/home/aldo/.local/bin/vb", "-l", NULL};
static const char *db[] = { "/home/aldo/.local/bin/vb", "-h", NULL};
static const char *iv[] = { "/home/aldo/.local/bin/vb", "-j", NULL};
static const char *dv[] = { "/home/aldo/.local/bin/vb", "-k", NULL};

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Alma Mono:size=10:antialias=true" };
static const char dmenufont[]       = "Alma Mono:size=10:antialias=true";
static const char col_gray1[]       = "#2e3440";
static const char col_gray2[]       = "#2e3440";
static const char col_gray3[]       = "#d8dee9";
static const char col_gray4[]       = "#d8dee9";
static const char col_cyan[]        = "#8fbcbb";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray3, col_gray1,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define MOD2KEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray1, NULL };
static const char *termcmd[]  = { "urxvt", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_Right,  spawn,          {.v = cmusnext } },
    { MODKEY|ShiftMask,             XK_Left,   spawn,          {.v = cmusprev } },
    { MODKEY|ShiftMask,             XK_Up,     spawn,          {.v = cmusvi } },
    { MODKEY|ShiftMask,             XK_Down,   spawn,          {.v = cmusvd } },
    { MODKEY|ShiftMask,             XK_d,      spawn,          {.v = playpause } },
    { MODKEY|ShiftMask,             XK_s,      spawn,          {.v = clipboardss } },
    { MODKEY|ShiftMask,             XK_a,      spawn,          {.v = save_ss_as } },
    { MODKEY|ShiftMask,             XK_z,      spawn,          {.v = snapshot } },
    { MODKEY|ShiftMask,             XK_x,      spawn,          {.v = dclipboardss } },
    { MODKEY|ShiftMask,             XK_r,      spawn,          {.v = sr } },
    { MODKEY|ShiftMask,             XK_m,      spawn,          {.v = pm } },
    { MODKEY|ShiftMask,             XK_e,      spawn,          {.v = lt } },
    { MODKEY|ShiftMask,             XK_f,      spawn,          {.v = rd } },
    { MODKEY|ShiftMask,             XK_w,      spawn,          {.v = conet } },
    { MODKEY|ShiftMask,             XK_n,      spawn,          {.v = mount } },
    { MODKEY|ShiftMask,             XK_j,      spawn,          {.v = pb } },
    { MODKEY|ShiftMask,             XK_k,      spawn,          {.v = pb_clipboard } },
    { MODKEY|ShiftMask,             XK_i,      spawn,          {.v = ff } },
    { MODKEY|ShiftMask,             XK_o,      spawn,          {.v = fd } },
    { MODKEY|ShiftMask,             XK_p,      spawn,          {.v = fr } },
    { MODKEY|ShiftMask,             XK_b,      spawn,          {.v = bm } },
    { MOD2KEY,                      XK_c,      spawn,          {.v = calcurse } },
    { MOD2KEY,                      XK_e,      spawn,          {.v = lf } },
    { MOD2KEY,                      XK_f,      spawn,          {.v = firefox } },
    { MOD2KEY,                      XK_m,      spawn,          {.v = cmus } },
    { MOD2KEY,                      XK_n,      spawn,          {.v = newsboat } },
    { MOD2KEY,                      XK_l,      spawn,          {.v = lo } },
    { MOD2KEY,                      XK_p,      spawn,          {.v = elaunch } },
    { MOD2KEY,                      XK_g,      spawn,          {.v = n64 } },
    { MOD2KEY,                      XK_s,      spawn,          {.v = surf } },
    { MOD2KEY,                      XK_t,      spawn,          {.v = teams } },
    { MOD2KEY,                      XK_v,      spawn,          {.v = vim } },
    { MOD2KEY,                      XK_y,      spawn,          {.v = ytfzf } },
    //inician combinaciones locales
    { MOD2KEY,          XK_Up,     spawn,      {.v = iv} },
    { MOD2KEY,          XK_Down,   spawn,      {.v = dv} },
    { MOD2KEY,          XK_Right,  spawn,      {.v = ib} },
    { MOD2KEY,          XK_Left,   spawn,      {.v = db} },
    //terminan combinaciones locales
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

