{ pkgs, ... }:

let
  globalCfg = ''
    -Dawt.toolkit.name=WLToolkit
  '';
in 
{
  home.packages = with pkgs; [
    # jetbrains.idea
    jetbrains.pycharm
  ];

  xdg.configFile = {
    "JetBrains/PyCharm2025.3/pycharm64.vmoptions".text = globalCfg;
  };
}
