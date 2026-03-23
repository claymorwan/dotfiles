{ pkgs, lib, config, ... }:

{
  programs.mangohud = {
    enable = true;
  };

  xdg.configFile = let
    baseCfg = builtins.readFile config.xdg.configFile."MangoHud/MangoHud.conf".source;
  in
  lib.mkIf config.programs.mangohud.enable {
    "MangoHud/sober.conf".text = baseCfg;
    
    "MangoHud/java.conf".text = ''
      font_file=${pkgs.monocraft}/share/fonts/truetype/73269753w3c5iyka768ng2khajahvqdh-Monocraft.ttc
    '' + baseCfg;
    
    "MangoHud/ENA-4-DreamBBQ.conf".text = ''
      font_file=${pkgs.no-continue}/share/fonts/truetype/gomarice_no_continue.ttf
    '' + baseCfg;
  };
}
