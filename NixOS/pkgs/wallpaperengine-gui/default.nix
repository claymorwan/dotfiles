{
  stdenv,
  lib,
  fetchFromGitHub,
  cmake,
  pkg-config,
  qt6,
  linux-wallpaperengine,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "wallpaperengine-gui";
  version = "1.1.8";

  src = fetchFromGitHub {
    owner = "MikiDevLog";
    repo = "wallpaperengine-gui";
    rev = "v${finalAttrs.version}";
    hash = "sha256-1BzfchQCZe/dqE1eJJkTvjsDI6a7cX6/VyBV+IMpDck=";
  };

  nativeBuildInputs = [
    cmake
    qt6.wrapQtAppsHook
    pkg-config
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qtwebengine
    qt6.qtmultimedia
    linux-wallpaperengine
  ];

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [  ];
  };
})
