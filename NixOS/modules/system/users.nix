{
  inputs,
  pkgs,
  username,
  host,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs
        username
        host
        # system
        ;
    };
    users.${username} = {
      imports = [
        ./../home
      ];

      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
      };
    };
  };

  users = {
    mutableUsers = true;
    users = {
      ${username} = {
        isNormalUser = true;
        description = "${username}";
        extraGroups = [
          "docker"
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
        ignoreShellProgramCheck = true;
      };
    };
  };

  nix.settings.allowed-users = [ "${username}" ];
  services.accounts-daemon.enable = true;
}
