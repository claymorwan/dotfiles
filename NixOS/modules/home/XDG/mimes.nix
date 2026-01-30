{ lib, ... }:

{
  xdg.mimeApps = let
    value = "dms-open.desktop";
    associations = builtins.listToAttrs (
      map
        (name: {
          inherit name value;
        })
        [
        "image/png"
        "application/zip"
        ]
    );
  in
  {
    enable = true;
    associations.added = lib.attrsets.mergeAttrsList [
    {
      "inode/directory" = "yazi.desktop";
    }
    associations
    ];

    defaultApplications = lib.attrsets.mergeAttrsList [
    {
      "inode/directory" = "yazi.desktop";
    }
    associations
    ];
  };
}
