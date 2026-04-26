{ pkgs, osConfig, ... }:

{
  programs.lutris = {
    enable = true;
    package = (pkgs.lutris.override {
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
    });

    defaultWinePackage = pkgs.proton-ge-bin;
    protonPackages = osConfig.programs.steam.extraCompatPackages;

    runners.wine.settings.system.env.PROTON_ENABLE_WAYLAND = 1;
  };
}
