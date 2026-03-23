{ inputs, config, ... }:

{
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = config.globVars.ctp_flavor;
    accent = config.globVars.ctp_accent;
    sddm.enable = false;
  };
}
