{ pkgs, lib, config, inputs, ... }:

{
  languages.dotnet = {
    enable = true;
  };

  packages = with pkgs; [
  
  ];
}
