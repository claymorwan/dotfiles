{
  programs.niri.settings = {
    spawn-at-startup = [
      { argv = [ "gnome-keyring-daemon --start --components=secrets" ]; }
      { argv = [ "mpris-proxy" ]; }
      { argv = [ "equibop --start-minimized" ]; }
    ];
  };
}
