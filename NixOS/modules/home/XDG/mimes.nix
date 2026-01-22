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
    associations.added = associations;
    defaultApplications = associations;
  };
}
