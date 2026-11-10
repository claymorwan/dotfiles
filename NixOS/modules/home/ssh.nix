{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "codeberg.org" = {
        identityFile = "~/.ssh/codeberg";
        user = "git";
      };
      
      "github.com" = {
        identityFile = "~/.ssh/github";
        user = "git";
      };

      "aur.archlinux.org" = {
        identityFile = "~/.ssh/aur";
        user = "aur";
      };

      "tangled.org" = {
        identityFile = "~/.ssh/tangled";
        user = "git";
      };
  
      "iparla" = {
        identityFile = "~/.ssh/iut";
        SetEnv.TERM = "xterm-256color";
      };

      "185.174.255.56".SetEnv.TERM = "xterm-256color";
    };
  };
}
