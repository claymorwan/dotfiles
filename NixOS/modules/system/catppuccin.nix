{ inputs, config, ... }:

{
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    autoEnable = config.catppuccin.enable;
    flavor = config.globVars.ctp_flavor;
    accent = config.globVars.ctp_accent;
    sddm.enable = false;
  };
}
