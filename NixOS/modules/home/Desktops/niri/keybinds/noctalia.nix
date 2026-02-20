{
  programs.niri.settings.binds = {
    "Mod+S" = {
      action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
      repeat = false;
      hotkey-overlay.title = "Launcher";
    };

    "Mod+I" = {
      action.spawn = [ "noctalia-shell" "ipc" "call" "settings" "toggle" ];
      repeat = false;
      hotkey-overlay.title = "Settings";
    };

    "Mod+V" = {
      action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "clipboard" ];
      repeat = false;
      hotkey-overlay.title = "Clipboard";
    };

    "Mod+Alt+L" = {
      action.spawn = [ "noctalia-shell" "ipc" "call" "sessionMenu" "lockAndSuspend" ];
      repeat = false;
      hotkey-overlay.title = "Lock screen";
    };

    # Audio controls
    "XF86AudioRaiseVolume" = {
      action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "increase" ];
      hotkey-overlay.title = "Volume up";
    };
    "XF86AudioLowerVolume" = {
      action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "decrease" ];
      hotkey-overlay.title = "Volume down";
    };
  };
}
