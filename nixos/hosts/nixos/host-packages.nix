{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
      # linuxKernel.packages.linux_6_17.rtl88x2bu
    ];
}
