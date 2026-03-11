{ pkgs, lib, config, inputs, ... }:

let
  dotnet = dotnetCorePackages.dotnet_10;
in 
{
  packages = with pkgs; [
    dotnet.sdk
  ];
}
