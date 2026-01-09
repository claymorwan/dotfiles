{
  inputs,
  pkgs,
  username,
  host,
  # system,
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
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        inputs.catppuccin.homeModules.catppuccin
      ];

      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
      };
    };
  };
  users.mutableUsers = true;
  users.users.${username} = {
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
  nix.settings.allowed-users = [ "${username}" ];
  services.accounts-daemon.enable = true;
}
