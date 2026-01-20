{
  stdenv,
  lib,
  fetchurl,
  fetchpatch,
  libsForQt5,
}:

let
  inherit (lib) getDev;
in

stdenv.mkDerivation rec {
  pname = "qt5ct";
  version = "1.9";

  src = fetchurl {
    url = "mirror://sourceforge/qt5ct/qt5ct-${version}.tar.bz2";
    sha256 = "sha256-3BDmk51CO5JZgc5n/rsaAVtvYcAiqcx+bIte/qRYi/8=";
  };

  nativeBuildInputs = [
    libsForQt5.qmake
    libsForQt5.qttools
    libsForQt5.wrapQtAppsHook
  ];

  buildInputs = [
    libsForQt5.qtbase
    libsForQt5.qtsvg
  ];

  patches = [
    fetchpatch {
      url = "https://aur.archlinux.org/cgit/aur.git/plain/qt5ct-shenanigans.patch?h=qt5ct-kde";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    }
  ];

  qt5.qmakeFlags = [
    "LRELEASE_EXECUTABLE=${getDev libsForQt5.qttools}/bin/lrelease"
    "PLUGINDIR=${placeholder "out"}/${libsForQt5.qtbase.qtPluginPrefix}"
    "LIBDIR=${placeholder "out"}/lib"
  ];

  meta = {
    description = "Qt5 Configuration Tool";
    homepage = "https://sourceforge.net/projects/qt5ct/";
    platforms = lib.platforms.linux;
    license = lib.licenses.bsd2;
    maintainers = [ ];
    mainProgram = "qt5ct";
  };
}
