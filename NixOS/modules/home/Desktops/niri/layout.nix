{
  programs.niri.settings.layout = {
    # gaps = 15;
    always-center-single-column = true;

    default-column-width = { proportion = 0.33333; };

    border = {
      enable = true;
      width = 2;
      active.color = "#cba6f7";
      inactive.color = "#313244";
      urgent.color = "#f38ba8";
    };

    shadow = {
      enable = true;
      draw-behind-window = true;
    };

    # struts = let
    # in  {
    #   left = 
    # };

    background-color = "#181825";
  };
}
