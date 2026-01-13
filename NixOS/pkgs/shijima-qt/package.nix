{
  stdenv,
  qt6,
  fetchFromGitHub,
  pkg-config,
  wayland-protocols,
  wayland,
  zip,
}:

stdenv.mkDerivation {
  pname = "shijima-qt";
  version = "0.2.0-alpha1";

  src = fetchFromGitHub {
    owner = "claymorwan";
    repo = "Shijima-Qt";
    rev = "fix/use-https-for-submodules";
    hash = "sha256-ein4esc3h1Rl4p0XEglonYY4LroA/PZRKLj0m3IbbbE=";
    fetchSubmodules = true;
  };

  buildInputs = [
    qt6.qtbase
    qt6.qtmultimedia
  ];
  nativeBuildInputs = [
    qt6.wrapQtAppsHook
    pkg-config
    wayland-protocols
    zip
  ];

  makeFlags = [ "CONFIG=release" ];

}
