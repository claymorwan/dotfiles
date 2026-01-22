{
  xdg.mimeApps = let
    associations = {
      "image/png" = "org.kde.gwenview.desktop";
    };
  in
  {
    enable = true;
    associations.added = associations;
    # defaultApplications = associations;
  };
}
