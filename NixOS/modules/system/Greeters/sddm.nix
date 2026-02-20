{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.qtdeclarative
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${pkgs.fetchgit {
      url = "https://github.com/mahaveergurjar/sddm";
      rev = "7bd7e88f5511e935dc448bcba42b79077a74b8bd";
      hash = "sha256-Qa2/b8P8Pk1qttMEdpKbExiljGmQEoCrm0tENmFaPak=";
    }}";
  };
}
