{
  programs.hyfetch = {
    enable = true;

    settings = {
      preset = "pansexual";
      mode = "rgb";
      auto_detect_light_dark = true;
      light_dark = "dark";
      color_align = {
        mode = "horizontal";
      };
      backend = "fastfetch";
      args = null;
      distro = null;
      pride_month_disable = false;
      custom_ascii_path = null;
    };
  };
}
