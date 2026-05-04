{ pkgs, host, ... }:

{
  imports = [] ++ (if (host != "android") then [ ./desktop.nix ] else []);

  home.packages = with pkgs; [
    fzf
    lolcat
    kittysay

  ];
}
