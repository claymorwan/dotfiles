let
  username = "claymorwan";
  home = "/home/${username}";
  dotfiles = "${home}/.dotfiles";
in
{
  username = "${username}";
  mainMod = "SUPER";
  
  mouse_cursor = "akita-neru";

  # Apps
  launch_prefix = "app2unit --";
  terminal = "ghostty";
  browser = "zen";

  # Dirs
  home_dir = "${home}";
  dotfiles_dir = "${dotfiles}";
  flake_dir = "${dotfiles}/NixOS";
  screenshot_dir = "${home}/Pictures/Screenshots";
  submodules_dir = "${dotfiles}/Submodules";
}
