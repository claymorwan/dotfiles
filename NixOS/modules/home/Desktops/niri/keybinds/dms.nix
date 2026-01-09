{
  programs.niri.settings.binds = {
    "Mod+Super_L".action.spawn = [ "dms" "ipc" "call" "spotlight" "toggle" ];
    "Mod+V".action.spawn = [ "dms" "ipc" "call" "clipboard" "toggle" ];
    "Mod+M".action.spawn = [ "dms" "ipc" "call" "processlist" "toggle" ];
    "Mod+N".action.spawn = [ "dms" "ipc" "call" "notifications" "toggle" ];
    "Mod+I".action.spawn = [ "dms" "ipc" "call" "settings" "toggle" ];
    "Mod+P".action.spawn = [ "dms" "ipc" "call" "notepad" "toggle" ];
    "Mod+Alt+L".action.spawn = [ "dms" "ipc" "call" "lock" "lock" ];
    "Mod+X".action.spawn = [ "dms" "ipc" "call" "powermenu" "toggle" ];
    "Mod+Shift+S".action.spawn = [ "dms" "ipc" "call" "control-center" "toggle" ];
    
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
