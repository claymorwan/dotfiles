{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # jetbrains.idea
    (jetbrains.pycharm.override {
      forceWayland = true;
    })
  ];
}
