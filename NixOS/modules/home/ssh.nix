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
    };
  };
}
