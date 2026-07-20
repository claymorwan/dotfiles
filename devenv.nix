{ pkgs, lib, config, inputs, ... }:

{
  languages.python = {
    enable = true;
    venv = {
      enable = true;
      requirements = ''
        entangled-cli
      '';
    };
  };

  enterShell = ''
    cd NixOS    
  '';
}
