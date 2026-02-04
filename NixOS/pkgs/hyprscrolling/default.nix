{
  lib,
  fetchFromGitHub,
  cmake,
  hyprland,
  hyprlandPlugins,
}:

let
  plugin-src = fetchFromGitHub {
    owner = "hyprwm";
    repo = "hyprland-plugins";
    rev = "06c0749a0dac978d89b1a76ae6adc76a3c15dbfa";
    hash = "sha256-eVD4U3Oqzz0VU9ylJ5wo76xDcYKv2CpiiRXq4Is4QdA=";
  };
in 
hyprlandPlugins.mkHyprlandPlugin (finalAttrs: {
  pluginName = "hyprscrolling";
  version = "0.53.3";

  src = "${plugin-src}/${finalAttrs.pluginName}";

  # any nativeBuildInputs required for the plugin
  nativeBuildInputs = [cmake];

  # set any buildInputs that are not already included in Hyprland
  # by default, Hyprland and its dependencies are included
  buildInputs = [];

  meta = {
    homepage = "https://github.com/hyprwm/hyprland-plugins";
    description = "Hyprland hyprscrolling plugin";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
})
