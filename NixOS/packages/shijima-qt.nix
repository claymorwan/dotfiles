{
  stdenv,
  qt6,
  fetchFromGitHub,
  pkg-config,
  wayland-protocols,
  wayland,
}:

stdenv.mkDerivation {
  pname = "shijima-qt";
  version = "0.2.0-alpha1";

  src = fetchFromGitHub {
    owner = "claymorwan";
    repo = "Shijima-Qt";
    rev = "a022c957d9b18fac579d9ca344b56df1ac41420f";
    hash = "sha256-j89gmQMWvX7iukkTkOMZ46WXoUtWHNC+bht7mAeXWPE=";
  };

  buildInputs = [
    qt6.qtbase
    qt6.qtmultimedia
  ];
  nativeBuildInputs = [
    qt6.wrapQtAppsHook
    pkg-config
    wayland-protocols
  ];

}
