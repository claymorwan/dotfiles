{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Scroll
      "$mainMod, left, layoutmsg, move -col"
      "$mainMod, right, layoutmsg, move +col"
      "$mainMod SHIFT, mouse_down, layoutmsg, move -col"
      "$mainMod SHIFT, mouse_up, layoutmsg, move +col"

      # Resize col
      "$mainMod Ctrl, I, layoutmsg, colresize +0.2"
      "$mainMod Ctrl, o, layoutmsg, colresize -0.2"
      "$mainMod SHIFT, I, layoutmsg, fit active"
      "$mainMod SHIFT, O, layoutmsg, fit all"

      # Move col
      # "$mainMod SHIFT, right, layoutmsg, movewindowto r"
      # "$mainMod SHIFT, left, layoutmsg, movewindowto l"
      # "$mainMod SHIFT, up, layoutmsg, movewindowto u"
      # "$mainMod SHIFT, down, layoutmsg, movewindowto d"
      "$mainMod CTRL, left, layoutmsg, swapcol l"
      "$mainMod CTRL, right, layoutmsg, swapcol r"
    ];
  };
}
