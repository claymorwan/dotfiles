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

    uv = {
      enable = true;
    };
  };

  packages = with pkgs.python3.pkgs;[
  ];
}
