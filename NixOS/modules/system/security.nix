{ pkgs, ... }:

{
  security = {
    polkit.enable = true;
    rtkit.enable = true;

    sudo = {
      enable = true;
      extraRules = [
        {
          commands = [
            {
              command = "${pkgs.nh}/bin/nh";
              options = [ "NOPASSWD" ];
            }
          ];
          groups = [ "wheel" ];
        }
      ];
      # extraConfig = with pkgs; ''
      #   Defaults:picloud secure_path="${lib.makeBinPath [
      #     systemd
      #   ]}:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
      # '';
    };
  };
}
