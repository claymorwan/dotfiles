{ pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
      input-overlay
      # droidcam-obs
      (pkgs.callPackage ../../packages/droidcam-obs.nix { })
      # obs-vkcapture
      # obs-source-clone
      # obs-move-transition
      # obs-composite-blur
      # obs-backgroundremoval
    ];
  };
}

