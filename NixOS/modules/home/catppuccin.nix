{ inputs, osConfig, ... }:

{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = osConfig.globVars.ctp_flavor;
    accent = osConfig.globVars.ctp_accent;
    nvim.enable = false;
    # gtk.icon.enable = false;
    kvantum = {
      enable = false;
      assertStyle = false;
    };
  };
}
