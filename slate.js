// Bindings for slate.
// Forked from ajoslin/dotfiles
// Hotkeys for quickly opening apps & changing window size

// Window size /position shortcuts
// ctrl+shift+h = use left half of screen. 
// ctrl+shift+l = right half, hjkl 
// ctrl+shift+m = use full window
//
// Binds modal key + {char} to focus different open apps
// ctrl-s + h = focus hipchat
// ctrl-s + f = focus iterm
// etc, see below

var modal_key = ":s,ctrl";

// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000
});

S.bnda({
  // Push Bindings
  "l:ctrl;shift" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }),
  "h:ctrl;shift" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }),
  "k:ctrl;shift" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  "j:ctrl;shift" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),
  "m:ctrl;shift" : S.op("push", { "direction": "left", "style": "bar-resize:screenSizeX" }),
});

function appIsOpen(name) {
  var isOpen = false;
  slate.eachApp(function(app) {
    if (app.name == name) isOpen = true;
  });
  return isOpen;
}

var focus_apps = {
  f: 'iTerm',
  m: 'Messages',
  h: 'HipChat',
  x: 'Xcode',
  i: 'iOS Simulator',
  p: 'Spotify',
  c: 'Google Chrome',
  s: 'Safari',
  b: 'Google Chrome Canary'
};

_(focus_apps).forEach(function(app, key) {
  S.bind(key + modal_key, S.op("focus", {app: app}));
});
