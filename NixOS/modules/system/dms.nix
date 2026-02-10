{
  inputs,
  username,
  system,
  ...
}:

let
  inherit (import ../../variables)
    home_dir
    dotfiles_dir
    ;
in
{
  imports = [
    inputs.dms.nixosModules.greeter
  ];

  programs = {
    dank-material-shell = {
      greeter = {
        enable = true;
        compositor.name = "niri";

        configHome = "${home_dir}";
        configFiles = [
          "${dotfiles_dir}/Configs/dms/.config/DankMaterialShell/settings.json"
        ];
      };
    };
  };
}
