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

  gameOptions = id: {
    id = id;
    launchOptions.wrappers = defaultWrappers;
  };

  winGameOptions = id: recursiveUpdate (gameOptions id) {
    
    compatTool = "GE-Proton";
    launchOptions = {
      wrappers = defaultWrappers;
      env = {
        PROTON_ENABLE_WAYLAND = 1;
        SCB_AUTO_RES = 1;
      };
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
      desktopEntries = true;
    
      apps = {
        "Geometry dash" = recursiveUpdate (winGameOptions 322170) {
          launchOptions.env.WINEDLLOVERRIDES = "xinput1_4=n,b";
        };

        "Titanfall 2" = recursiveUpdate (winGameOptions 1237970) {
          launchOptions = {
            wrappers = defaultWrappers ++ gamescopeWrapper;
            env = {
              PROTON_ENABLE_WAYLAND = 0;
              OPENSSL_ia32cap = "~0x20000000";
            };

            args = [
              "-novid"
            ];
          };
        };

        "Subnautica" = recursiveUpdate (winGameOptions 264710) {
          launchOptions.env.WINEDLLOVERRIDES = "winhttp=n,b";
        };

       "Subnautica: Below Zero" = recursiveUpdate (winGameOptions 848450) {
          launchOptions.env.WINEDLLOVERRIDES = "winhttp=n,b";
        };

        "Subnautica 2" = recursiveUpdate (winGameOptions 1962700) {
          launchOptions.env.WINEDLLOVERRIDES = "dwmapi=n,b";
        };

        "Spelunky 2" = winGameOptions 2418530;

        "Peak" = winGameOptions 3527290;

        "Waterpark simulator" = winGameOptions 3293260;

        "Portal 2" = winGameOptions 620;

        "Portal Revolution" = winGameOptions 601360;

        "R.E.P.0" = winGameOptions 3241660;

        "IN HEAT: Lustful Nights" = gameOptions 1962890;

        "Pieces of my Heart" = winGameOptions 1226640;

        "Overcooked 2" = winGameOptions 728880;

        "Slime Rancher" = winGameOptions 433340;

        "The Beginner's Guide" = winGameOptions 303210;

        "Wasteland bites Demo" = gameOptions 3820720;

        "Ultrakill" = winGameOptions 1229490;

        "Pizza tower" = winGameOptions 2231450;

        "Ena DBBQ" = gameOptions 2134320;

        "Denshattack Demo" = winGameOptions 4142750;

        "Boost vector EX Demo" = gameOptions 4338440;

        "Awaria"= winGameOptions 3274300;

        # White Knuckle
        "White Knuckle" = winGameOptions 3195790;

        "White Knuckle Demo" = winGameOptions 3218540;

        "Herringen Demo" = winGameOptions 4283210;

        "Quaver" = gameOptions 980610;

        "Data Center Demo" = winGameOptions 4376050;

        "Nothing Together" = winGameOptions 2788630;

        "Content Warning" = winGameOptions 2881650;

        "Subterranauts" = winGameOptions 3075800;

        "Lethal Company" = winGameOptions 1966720;

        "Rabbit and Steel" = winGameOptions 2132850;

        "BOMMY Playtest" = winGameOptions 4365450;

        "Game Game Developer" = winGameOptions 4449070;
        
        "House Flipper" = winGameOptions 613100;

        "Wallpaper engine" = winGameOptions 431960;

        "Crypt of the NecroDancer" = gameOptions 247080;

        "Rift of the NecroDancer Demo" = winGameOptions 3029150;

        "MOTORSLICE Demo" = winGameOptions 3910170;
        
        "MOTORSLICE" = winGameOptions 2830030;

        "Creature Kitchen Demo" = winGameOptions 4116110;

        "Among Us" = winGameOptions 945360;

        "Shift At Midnight Multiplayer Demo" = winGameOptions 4050060;

        "ARSONATE" = gameOptions 2822980;

        "ARSONATE Demo" = gameOptions 2849630;

        "Random Racing Demo" = winGameOptions 2199940;

        "Retail Hell Demo" = winGameOptions 4379260;

        "Bit Buddy Demo" = winGameOptions 3950450;

        "Colossus - Eternal Blight" = winGameOptions 4802920;

        "WEBFISHING" = winGameOptions 3146520;

        "DELTARUNE" = winGameOptions 1671210;

        "Chunky JUMP!" = winGameOptions 4016020;

        "ReStory Chill Electronic Repairs Demo" = winGameOptions 4146680;

        "VHOLUME Demo" = winGameOptions 4245250;

        "XenoFeels Demo" = winGameOptions 4791300;
      };
    };
  };
}
