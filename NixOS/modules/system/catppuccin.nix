{ inputs, ... }:

let
  inherit (import ../../variables)
    ctp_flavor
    ctp_accent
    ;
in
{
  catppuccin = {
    enable = true;
    flavor = ctp_flavor;
    accent = ctp_accent;
  };
}
