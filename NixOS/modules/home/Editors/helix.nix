{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      editor = {
        cursor-shape.insert = "bar";
        clipboard-provider = "wayland";
        file-picker = {
          hidden = false;
          deduplicate-links = false;
        };
      };

      keys.normal = {
        "C-s" = ":w";
        "C-q" = ":q";
      };
    };
  };
}
