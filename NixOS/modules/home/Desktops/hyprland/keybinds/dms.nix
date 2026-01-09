let
  inherit (import ../../../../../variables/variables.nix)
    mainMod
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "${mainMod}, ${mainMod}_L, exec, dms ipc call spotlight toggle # Spotlight"
      "${mainMod}, V, exec, dms ipc call clipboard toggle # Clipboard"
      "${mainMod}, M, exec, dms ipc call processlist toggle # Process list"
      "${mainMod}, N, exec, dms ipc call notifications toggle # Notifications"
      "${mainMod}, I, exec, dms ipc call settings toggle # Settings"
      "${mainMod}, P, exec, dms ipc call notepad toggle # Notepad"
      "${mainMod} + ALT, L, exec, dms ipc call lock lock # Lock"
      "${mainMod}, X, exec, dms ipc call powermenu toggle # Power menu"
      "${mainMod} SHIFT, S, exec, dms ipc call control-center toggle # Control center"
      "${mainMod}, TAB, exec, dms ipc call hypr toggleOverview # Workspace overview"
      "${mainMod}, KP_Divide, exec, dms ipc call keybinds toggle hyprland # Cheat sheet"

      "${mainMod} + SHIFT, N, exec, dms ipc call night toggle # Night mode"

      "${mainMod}, A, exec, dms ipc call desktopWidget toggleOverlay dw_sysmon_primary # Wiget overlay"
    ];

    bindl = [
      # Audio controls
      ", XF86AudioRaiseVolume, exec, dms ipc call audio increment 3 # Volume up"
      ", XF86AudioLowerVolume, exec, dms ipc call audio decrement 3 # Volume down"
      ", XF86AudioMute, exec, dms ipc call audio mute # Mute"
      ", XF86AudioMicMute, exec, dms ipc call audio micmute # Mute mic"

      # Brightness control
      ", XF86MonBrightnessUp, exec, dms ipc call brightness increment 5 '' # Brightness up"
      ", XF86MonBrightnessDown, exec, dms ipc call brightness decrement 5 '' # Brightness down"

    ];
  };
}
