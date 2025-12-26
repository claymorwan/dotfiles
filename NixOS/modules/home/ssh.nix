{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "codeberg.org" = {
        identityFile = "~/.ssh/codeberg";
        user = "git";
      };
      "github.com" = {
        identityFile = "~/.ssh/github";
        user = "git";
      };
    };
  };
}
