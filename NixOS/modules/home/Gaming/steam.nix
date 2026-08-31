{ inputs, pkgs, lib, ... }:

let
  inherit (lib)
  recursiveUpdate
  ;
  
  system = pkgs.stdenv.hostPlatform.system;

  defaultWrappers = [
    pkgs.gamemode
    (lib.getExe' pkgs.mangohud "mangohud")
  ];

  gamescopeWrapper = [
    (lib.getExe' inputs.scopebuddy.packages.${system}.default "scopebuddy")
    "-w" "3840" "-h" "2160"
    "-O" "DP-1"
    "-f"
    "--expose-wayland"
    "--"
   ];

  gameOptions = name: {
    name = name;
    wrappers = defaultWrappers;
  };

  winGameOptions = name: recursiveUpdate (gameOptions name) {
    # compatTool = "GE-Proton";
    wrappers = defaultWrappers;
    env = {
      PROTON_ENABLE_WAYLAND = 1;
      SCB_AUTO_RES = 1;
    };
  };
in
{
  imports = [
    inputs.steam-config-nix.homeModules.default
  ];

  home.packages = with pkgs; [
    sgdboop
    inputs.scopebuddy.packages.${system}.default
  ];

  programs.steam = {
    millennium = {
      enable = true;
      activeTheme = "material";

      themes = {
        material = pkgs.millennium-material-theme;
      };

      plugins = {
        extendium = pkgs.extendium;
      };

      config = {
        themes.conditions.material.Color = "Catppuccin";
      };
    };

    config = {
      enable = true;
      onSteamRunning = "close"; # See 'Important' note at beginning of this readme
      desktopEntries.enable = true;
      defaultCompatTool = "GE-Proton";
    
      apps = {
       
        "4162040" = recursiveUpdate (winGameOptions "Zenless Zone Zero") {
          compatTool = inputs.dw-proton.packages.${pkgs.stdenv.hostPlatform.system}.dw-proton;
          rawLaunchOptions = "bash -c 'exec \"\${@/HYP.exe/games\/ZenlessZoneZero Game\/ZenlessZoneZero.exe}\"' -- %command%";

          env = {
            PROTON_USE_WINEALSA = 1;
            PROTON_DXVK_GPLASYNC = 1;
          };

          # args = [
          #   "-use-d3d12"
          # ];
        };

        "322170" = recursiveUpdate (winGameOptions "Geometry dash") {
          dllOverrides.xinput1_4 = "n,b";
        };

        "1237970" = recursiveUpdate (winGameOptions "Titanfall 2") {
          # wrappers = defaultWrappers ++ gamescopeWrapper;
          env = {
            # PROTON_ENABLE_WAYLAND = 0;
            OPENSSL_ia32cap = "~0x20000000";
          };
          
          args = [
            "-novid"
          ];
        };

        "264710" = recursiveUpdate (winGameOptions "Subnautica") {
          dllOverrides.winhttp = "n,b";
        };

       "848450" = recursiveUpdate (winGameOptions "Subnautica: Below Zero") {
          dllOverrides.winhttp = "n,b";
        };

        "1962700" = recursiveUpdate (winGameOptions "Subnautica 2") {
          dllOverrides.dwmapi= "n,b";
        };

        "2418530" = winGameOptions "Spelunky 2";

        "3527290" = winGameOptions "Peak";

        "3293260" = winGameOptions "Waterpark simulator";

        "620" = winGameOptions "Portal 2";

        "601360" = winGameOptions "Portal Revolution";

        "3241660" = winGameOptions "R.E.P.0";

        "1962890" = gameOptions "IN HEAT: Lustful Nights";

        "1226640" = winGameOptions "Pieces of my Heart";

        "728880" = winGameOptions "Overcooked 2";

        "433340" = winGameOptions "Slime Rancher";

        "303210" = winGameOptions "The Beginner's Guide";

        "3820720" = gameOptions "Wasteland bites Demo";

        "1229490" = winGameOptions "ULTRAKILL";

        "2231450" = winGameOptions "Pizza tower";

        "2134320" = gameOptions "ENA: Dream BBQ";

        "4142750" = winGameOptions "Denshattack Demo";

        "4338440" = gameOptions "Boost vector EX Demo";

        "3274300"= winGameOptions "Awaria";

        "3195790" = winGameOptions "White Knuckle";

        "4283210" = winGameOptions "Herringen Demo";

        "980610" = gameOptions "Quaver";

        "4376050" = winGameOptions "Data Center Demo";

        "2788630" = winGameOptions "Nothing Together";

        "2881650" = winGameOptions "Content Warning";

        "3075800" = winGameOptions "Subterranauts";

        "1966720" = winGameOptions "Lethal Company";

        "2132850" = winGameOptions "Rabbit and Steel";

        "4365450" = winGameOptions "BOMMY Playtest";

        "4449070" = winGameOptions "Game Game Developer";
        
        "613100" = winGameOptions "House Flipper";

        "431960" = winGameOptions "Wallpaper engine";

        "247080" = gameOptions "Crypt of the NecroDancer";

        "3029150" = winGameOptions "Rift of the NecroDancer Demo";

        # "3910170" = winGameOptions "MOTORSLICE Demo";
        
        "2830030" = winGameOptions "MOTORSLICE";

        # "4116110" = winGameOptions "Creature Kitchen Demo";

        "945360" = winGameOptions "Among Us";

        # "4050060" = winGameOptions "Shift At Midnight Multiplayer Demo";

        "2822980" = gameOptions "ARSONATE";

        # "2849630" = gameOptions "ARSONATE Demo";

        # "2199940" = winGameOptions "Random Racing Demo";

        # "4379260" = winGameOptions "Retail Hell Demo";

        "4802920" = winGameOptions "Colossus - Eternal Blight";

        "3146520" = winGameOptions "WEBFISHING";

        "1671210" = winGameOptions "DELTARUNE";

        # "4016020" = winGameOptions "Chunky JUMP!";

        "4146680" = winGameOptions "ReStory Chill Electronic Repairs Demo";

        "4245250" = winGameOptions "VHOLUME Demo";

        "4791300" = winGameOptions "XenoFeels Demo";

        "4101720" = winGameOptions "Liminal Shroud Demo";

        "4841090" = winGameOptions "Code RAPID Demo";

        "4700530" = winGameOptions "THE WELL IS NOT EMPTY Demo";

        "4130300" = winGameOptions "Ironwing Valiant: Record of Astera";

        "413150" = gameOptions "Stardew Valley";

        "765410" = gameOptions "Bean Battles";

        "774171" = winGameOptions "Muse Dash";
      };
    };
  };
}
