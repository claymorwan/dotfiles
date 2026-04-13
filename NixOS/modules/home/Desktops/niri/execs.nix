{ lib, config, osConfig, ... }:

{
  programs.niri.settings = {
    spawn-at-startup = [
      { sh =  "sleep 3; ${osConfig.globVars.discord} --start-minimized"; }
      { argv = [ "nsticky" ]; }
      { argv = [ "steam" "-silent" ]; }
      ( lib.mkIf config.programs.noctalia-shell.enable { argv = [ "wallpaperengine-gui" "--minimized" ]; })
    ];
  };
}
