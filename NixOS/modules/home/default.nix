{ host, ... }:

{
  imports = [
    ./catppuccin.nix
    ./env.nix
    ./fetchs
    ./git.nix
    ./Options
    ./Packages
    ./services.nix
    ./Shells
    ./starship.nix
    ./ssh.nix
    # ./uwsm.nix
    ./Yazi
  ]
  ++ (if (host != "android") then [
      ./Art
      ./Browsers
      ./Desktops
      ./Editors
      ./Gaming
      ./ghostty.nix
      ./obs-studio.nix
      ./spotify.nix
      ./Theming
      ./XDG
    ] else [])
  ;
}
