{ lib, host, ... }:

{
  programs.niri.settings = {
    spawn-at-startup = [
      # { sh =  "sleep 3; ${config.globVars.discord} --start-minimized"; }
      # { argv = [ "nsticky" ]; }
      (lib.mkIf (host == "nixos") { argv = [ "steam" "-silent" ]; })
      # ( lib.mkIf config.programs.noctalia-shell.enable { argv = [ "wallpaperengine-gui" "--minimized" ]; })
    ];
  };
}
