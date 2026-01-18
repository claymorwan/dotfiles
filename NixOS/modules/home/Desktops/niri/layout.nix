let
  inherit (import ./vars.nix)
  window_gap
  ;
in
{
  programs.niri.settings.layout = {
    gaps = window_gap;
    # always-center-single-column = true;

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
