let
  inherit (import ./../../../../variables/variables.nix)
    mainMod
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Scroll
      "${mainMod}, k, layoutmsg, move -col"
      "${mainMod}, l, layoutmsg, move +col"
      "${mainMod} Shift, k, layoutmsg, move +400"
      "${mainMod} Shift, l, layoutmsg, move -400"
      "${mainMod} SHIFT, mouse_down, layoutmsg, move -col"
      "${mainMod} SHIFT, mouse_up, layoutmsg, move +col"
      "${mainMod} Ctrl Shift, mouse_down, layoutmsg, move +400"
      "${mainMod} Ctrl Shift, mouse_up, layoutmsg, move -400"

      # Resize col
      "${mainMod} Ctrl, I, layoutmsg, colresize +0.2"
      "${mainMod} Ctrl, o, layoutmsg, colresize -0.2"
      "${mainMod} SHIFT, I, layoutmsg, fit active"
      "${mainMod} SHIFT, O, layoutmsg, fit all"

      # Move col
      "${mainMod} SHIFT, right, layoutmsg, movewindowto r"
      "${mainMod} SHIFT, left, layoutmsg, movewindowto l"
      "${mainMod} SHIFT, up, layoutmsg, movewindowto u"
      "${mainMod} SHIFT, down, layoutmsg, movewindowto d"
      "${mainMod} Ctrl, k, layoutmsg, swapcol l"
      "${mainMod} Ctrl, l, layoutmsg, swapcol r"
    ];
  };
}
