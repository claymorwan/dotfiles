{
  programs.niri.settings.binds = {
    "Mod+S" = {
      action.spawn = [ "dms" "ipc" "call" "spotlight" "toggle" ];
      repeat = false;
    };

    "Mod+V"= {
      action.spawn = [ "dms" "ipc" "call" "clipboard" "toggle" ];
      repeat = false;
    };

    "Mod+M" = {
      action.spawn = [ "dms" "ipc" "call" "processlist" "toggle" ];
      repeat = true;
    };

    "Mod+N" = {
      action.spawn = [ "dms" "ipc" "call" "notifications" "toggle" ];
      repeat = true;
    };

    "Mod+I" = {
      action.spawn = [ "dms" "ipc" "call" "settings" "toggle" ];
      repeat = false;
    };

    "Mod+P" = {
      action.spawn = [ "dms" "ipc" "call" "notepad" "toggle" ];
      repeat = false;
    };

    "Mod+Alt+L" = {
      action.spawn = [ "dms" "ipc" "call" "lock" "lock" ];
      repeat = false;
    };

    "Mod+X" = {
      action.spawn = [ "dms" "ipc" "call" "powermenu" "toggle" ];
      repeat = false;
    };

    "Mod+Shift+S" = {
      action.spawn = [ "dms" "ipc" "call" "control-center" "toggle" ];
      repeat = false;
    };
    # Audio controls
    "XF86AudioRaiseVolume".action.spawn = [ "dms" "ipc" "call" "audio" "increment" "3" ];
    "XF86AudioLowerVolume".action.spawn = [ "dms" "ipc" "call" "audio" "decrement" "3" ];
    "XF86AudioMute".action.spawn = [ "dms" "ipc" "call" "audio" "mute" ];
    "XF86AudioMicMute".action.spawn = [ "dms" "ipc" "call" "audio" "micmute" ];

    # Brightness control
    "XF86MonBrightnessUp".action.spawn = [ "dms" "ipc" "call" "brightness" "increment" "5" ];
    "XF86MonBrightnessDown".action.spawn = [ "dms" "ipc" "call" "brightness" "decrement" "5" ];
  };
}
