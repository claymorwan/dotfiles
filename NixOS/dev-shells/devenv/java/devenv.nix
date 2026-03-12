{ pkgs, lib, config, inputs, ... }:

{
  languages.java = {
    enable = true;
    gradle.enable = true;
  };

  packages = with pkgs; [

  ];
}
