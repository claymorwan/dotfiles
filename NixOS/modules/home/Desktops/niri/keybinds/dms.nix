{
  programs.niri.settings.binds = {
    "Mod+S" = {
      action.spawn = [ "dms" "ipc" "call" "spotlight" "toggle" ];
      repeat = false;
      hotkey-overlay.title = "Spotlight";
    };

    "Mod+V"= {
      action.spawn = [ "dms" "ipc" "call" "clipboard" "toggle" ];
      repeat = false;
      hotkey-overlay.title = "Clipboard";
    };

    "Mod+M" = {
      action.spawn = [ "dms" "ipc" "call" "processlist" "toggle" ];
      repeat = true;
      hotkey-overlay.title = "Process list";
    };

    "Mod+N" = {
      action.spawn = [ "dms" "ipc" "call" "notifications" "toggle" ];
      repeat = true;
      hotkey-overlay.title = "Notifications";
    };

    "Mod+I" = {
      action.spawn = [ "dms" "ipc" "call" "settings" "toggle" ];
      repeat = false;
      hotkey-overlay.title = "Settings";
    };

    "Mod+P" = {
      action.spawn = [ "dms" "ipc" "call" "notepad" "toggle" ];
      repeat = false;
      hotkey-overlay.title = "Notepad";
    };

    "Mod+Alt+L" = {
      action.spawn = [ "dms" "ipc" "call" "lock" "lock" ];
      repeat = false;
      hotkey-overlay.title = "Lock screen";
    };

    "Mod+X" = {
      action.spawn = [ "dms" "ipc" "call" "powermenu" "toggle" ];
      repeat = false;
      hotkey-overlay.title = "Power menu";
    };

    "Mod+Shift+S" = {
      action.spawn = [ "dms" "ipc" "call" "control-center" "toggle" ];
      repeat = false;
      hotkey-overlay.title = "Control center";
    };

    # Audio controls
    "XF86AudioRaiseVolume" = {
      action.spawn = [ "dms" "ipc" "call" "audio" "increment" "3" ];
      hotkey-overlay.title = "Volume up";
    };
    "XF86AudioLowerVolume" = {
      action.spawn = [ "dms" "ipc" "call" "audio" "decrement" "3" ];
      hotkey-overlay.title = "Volume down";
    };

    "XF86AudioMute" = {
      action.spawn = [ "dms" "ipc" "call" "audio" "mute" ];
      hotkey-overlay.title = "Mute audio";
    };

    "XF86AudioMicMute" = {
      action.spawn = [ "dms" "ipc" "call" "audio" "micmute" ];
      hotkey-overlay.title = "Mute mic";
    };

    # Brightness control
    "XF86MonBrightnessUp" = {
      action.spawn = [ "dms" "ipc" "call" "brightness" "increment" "5" ];
      hotkey-overlay.title = "Brightness up";
    };

    "XF86MonBrightnessDown" = {
      action.spawn = [ "dms" "ipc" "call" "brightness" "decrement" "5" ];
      hotkey-overlay.title = "Brightness down";
    };
  };
}
