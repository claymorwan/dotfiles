{ inputs, pkgs, ... }:

{
  imports = [
    inputs.archix.nixosModules.default
  ];

  environment = {
    systemPackages = with pkgs; [
      paru
      inputs.archix.packages.${pkgs.stdenv.hostPlatform.system}.devtools
    ];

    etc."paru.conf".text = ''
      [options]
      Chroot
    '';
  };
}
