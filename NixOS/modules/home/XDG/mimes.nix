{ lib, ... }:

{
  xdg.mimeApps =   {
    enable = true;
    associations = {
      added = {
        "inode/directory" = "yazi.desktop";
        "x-scheme-handler/nxm" = "amethystmodmanager-nxm.desktop";
      };

      removed = {
        "x-scheme-handler/nxm" = "limo.desktop";
      };
    };

    defaultApplications = {
      "inode/directory" = "yazi.desktop";
      "x-scheme-handler/nxm" = "amethystmodmanager-nxm.desktop";
    };
  };
}
