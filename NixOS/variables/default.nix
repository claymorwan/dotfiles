rec {
  username = "claymorwan";
  mainMod = "SUPER";

  # Theming
  ctp_flavor = "mocha";
  ctp_accent = "mauve";
  font_family = "JetBrainsMono Nerd Font";
  mouse_cursor = "akita-neru";

  # Apps
  launch_prefix = "app2unit --";
  terminal = "ghostty";
  browser = "zen-beta"; # "MOZ_LEGACY_PROFILES=1 zen-beta";
  discord = "equibop --wayland";

  # Dirs
  home_dir = "/home/${username}";
  dotfiles_dir = "${home_dir}/.dotfiles";
  flake_dir = "${dotfiles_dir}/NixOS";
  screenshot_dir = "${home_dir}/Pictures/Screenshots";
  submodules_dir = "${dotfiles_dir}/Submodules";

  # enable
  enableNiri = true;
  enableHyprland = true;
}
