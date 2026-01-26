let
  inherit (import ../../../../variables/default.nix)
  discord
  ;
in 
{
  programs.niri.settings = {
    spawn-at-startup = [
      # { argv = [ "gnome-keyring-daemon" "--start" "--components=secrets" ]; }
      # { argv = [ "mpris-proxy" ]; }
      { sh =  "sleep 3; ${discord} --start-minimized"; }
    ];
  };
}
