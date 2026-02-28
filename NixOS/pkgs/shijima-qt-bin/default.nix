{
  stdenv,
  lib,
  fetchzip,
  fetchurl,
  autoPatchelfHook,
  copyDesktopItems,
  makeDesktopItem,
  imagemagick,
  qt6,
  libunarr,
  libarchive,
}:

let
  appName = "shijima-qt";
in 
stdenv.mkDerivation (finalAttrs: {
  pname = "shjima-qt-bin";
  version = "0.2.0-alpha1";

  src = fetchzip {
    url = "https://github.com/pixelomer/Shijima-Qt/releases/download/v${finalAttrs.version}/release-linux-x86_64.zip";
    hash = "sha256-H0H15WthZabfSA0AFNDH0UuE4uK5UkF4IRynu1TbWTY=";
    stripRoot = false;
  };

  nativeBuildInputs = [
    autoPatchelfHook
    copyDesktopItems
    imagemagick
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qtmultimedia
    libunarr
    libarchive
  ];

  dontWrapQtApps = true;

  appIcon = fetchurl {
    url = "https://raw.githubusercontent.com/pixelomer/Shijima-Qt/refs/tags/v${finalAttrs.version}/shijima-qt.ico";
    hash = "sha256-oUKhoIAsUgmp/DBngcSKjpa5wtq1tvUKnHCA1jTDwYg=";
  };

  desktopItems = [
    (makeDesktopItem {
      name = appName;
      desktopName = "Shijima-Qt";
      exec = appName;
      icon = appName;
    })
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp ${appName} $out/bin

    mkdir -p $out/share/icons/hicolor/256x256/apps
    magick ${finalAttrs.appIcon} $out/share/icons/hicolor/256x256/apps/${appName}.png

    runHook postInstall
  '';

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ claymorwan ];
  };
})
