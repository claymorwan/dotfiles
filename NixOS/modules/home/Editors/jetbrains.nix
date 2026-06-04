{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (jetbrains.pycharm.override {
      forceWayland = true;
    })

    (android-studio.override {
      forceWayland = true;
    })
  ];
}
