{ inputs, ... }:

let
  inherit (import ../../variables)
    ctp_flavor
    ctp_accent
    ;
in
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = ctp_flavor;
    accent = ctp_accent;
    nvim.enable = false;
    # gtk.icon.enable = false;
    kvantum = {
      enable = false;
      assertStyle = false;
    };
  };
}
