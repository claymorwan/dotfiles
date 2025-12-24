{ inputs, ... }:

let
  inherit (import ../../variables/variables.nix)
    ctp_flavor
    ctp_accent
    ;
in
{
  catppuccin = {
    enable = true;
    flavor = ctp_flavor;
    accent = ctp_accent;
    nvim.enable = false;
    # gtk.icon.enable = false;
  };
}
