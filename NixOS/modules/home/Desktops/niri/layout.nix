{
  programs.niri.settings.layout = {
    # gaps = 15;
    always-center-single-column = true;

    default-column-width = { proportion = 0.66666; };

    border = {
      enable = true;
      width = 2;
      active.color = "#cba6f7";
      inactive.color = "#313244";
      urgent.color = "#f38ba8";
    };

    focus-ring.enable = false;

    shadow = {
      enable = false;
      draw-behind-window = true;
    };

    # struts = let
    # in  {
    #   left = 
    # };

    background-color = "#181825";
  };
}
