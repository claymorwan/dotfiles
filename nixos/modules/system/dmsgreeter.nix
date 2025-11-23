{ inputs, username, ... }:

{
  imports = [
    inputs.dankMaterialShell.nixosModules.greeter
  ];

  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "hyprland";  # Or "hyprland" or "sway"

    configHome = "/home/${username}";
  };
}
