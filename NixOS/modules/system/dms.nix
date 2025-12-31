{
  inputs,
  username,
  system,
  ...
}:

let
  inherit (import ../../variables/variables.nix)
    home_dir
    dotfiles_dir
    ;
in
{
  imports = [
    # inputs.dankMaterialShell.nixosModules.dankMaterialShell
    inputs.dms.nixosModules.greeter
  ];

  programs = {
    dank-material-shell = {
      greeter = {
        # enable = true;
        compositor.name = "hyprland"; # Or "hyprland" or "sway"

        configHome = "${home_dir}";
        configFiles = [
          "${dotfiles_dir}/Configs/dms/.config/DankMaterialShell/settings.json"
        ];
      };
    };
  };
}
