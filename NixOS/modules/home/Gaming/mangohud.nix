{ pkgs, lib, config, ... }:

{
  programs.mangohud = {
    enable = true;

    # settingsPerApplication = {
    #   java = {
    #     position = "top-left";
    #   };
    # };
  };

  xdg.configFile = let
    baseCfg = builtins.readFile config.xdg.configFile."MangoHud/MangoHud.conf".source;
  in
  lib.mkIf config.programs.mangohud.enable {
    "MangoHud/java.conf".text = ''
      font_file=${pkgs.monocraft}/share/fonts/truetype/73269753w3c5iyka768ng2khajahvqdh-Monocraft.ttc
    '' + baseCfg;
    "MangoHud/ENA-4-DreamBBQ.conf".text = ''
      font_file=${pkgs.callPackage ../../../pkgs/Fonts/no-continue.nix { }}/share/fonts/truetype/gomarice_no_continue.ttf
    '' + baseCfg;
  };
}
