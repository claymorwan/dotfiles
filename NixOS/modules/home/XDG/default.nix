{ pkgs, ... }:

{
  imports = [
    ./mimes.nix
  ];
  xdg = {
    configFile."xdg-desktop-portal-termfilechooser/config" = {
      # enable = false;
      text = ''
        [filechooser]
        cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
        default_dir=$HOME
        env=TERMCMD='ghostty --title="terminal-filechooser" -e'
        open_mode=suggested
        save_mode=last
      '';
    };
  };
}
