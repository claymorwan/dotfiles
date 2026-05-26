{ inputs, pkgs, ... }:

{
  imports = [
    inputs.omikuji.homeModules.default
  ];

  programs.omikuji = {
    enable = true;
    package = inputs.omikuji.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      # Intercept buildFHSEnv to modify target packages
      buildFHSEnv = args: pkgs.buildFHSEnv (args // {
        multiPkgs = envPkgs:
          let
            # Fetch original package list
            originalPkgs = args.multiPkgs envPkgs;

            # Disable tests for openldap
            customLdap = envPkgs.openldap.overrideAttrs (_: { doCheck = false; });
          in
          # Replace broken openldap with the custom one
          builtins.filter (p: (p.pname or "") != "openldap") originalPkgs ++ [ customLdap ];
      });
    };
    
    defaultWinePackage = pkgs.proton-ge-bin;

    winePackages = [ pkgs.wineWow64Packages.full ];
    # protonPackages = osConfig.programs.steam.extraCompatPackages;

    extraPackages = with pkgs; [
      umu-launcher
    ];

    settings = {

      defaults = {
        wine = {
          ntsync = true;
          dxvk = true;
          vkd3d = true;
          d3d_extras = true;
          fsr = true;
          battleye = true;
          easyanticheat = true;
        };

        launch.env.PROTON_USE_WAYLAND = "1";

        graphics.mangohud = true;
        graphics.gamescope.enabled = false;
        system.gamemode = true;
      };

      ui = {
        theme = {
          follow_system_colors = false;
          colors = {
            bg = "#181825";
            surface = "#1e1e2e";
            accent = "#cba6f7";
            accentText = "#11111b";
            text = "#cdd6f4";
            error = "#f38ba8";
            success = "#a6e3a1";
            warning = "#f9e2af";
          };
        };

        # categories = [
        #   {
        #     enabled = true;
        #     name = "FNAF";
        #     icon = "star";
        #     kind = "tag";
        #     value = "fnaf";
        #   }
        #
        #   {
        #     enabled = true;
        #     name = "NSFW";
        #     icon = "shield_moon";
        #     kind = "tag";
        #     value = "nsfw";
        #   }
        #
        #   {
        #     enabled = true;
        #     name = "Tools";
        #     icon = "build";
        #     kind = "tag";
        #     value = "tools";
        #   }
        #
        #   {
        #     enabled = true;
        #     name = "Itch.io";
        #     icon = "bookmark_check";
        #     kind = "tag";
        #     value = "itch.io";
        #   }
        # ];
      };
    };
  };
}
