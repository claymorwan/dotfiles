# with import <nixpkgs> { };

{
  stdenv,
  lib,
  fetchzip,
  autoPatchelfHook,
  mpv,
  gtk3,
  libxv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "namida-bin";
  version = "5.7.8-beta+260225164";

  src = fetchzip {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${finalAttrs.version}/namida-v5.7.8-beta.linux.tar.gz";
    hash = "sha256-wVfETwlXNEQoTxU5aiijUEXdGtPFy/6WN6xoUAGEvTk=";
    stripRoot = false;
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    mpv
    gtk3
    libxv
  ];

  installPhase = ''
    runHook preInstall

    # Install stuff
    mkdir -p $out/opt
    for e in "namida" "bin" "lib" "data"; do
      cp -r $e $out/opt
    done

    # Desktop entry
    mkdir -p $out/share/applications
    cp share/applications/namida.desktop $out/share/applications/namida.desktop
    # Metainfo
    mkdir -p $out/share/metainfo
    cp share/metainfo/namida.metainfo.xml $out/share/metainfo/namida.metainfo.xml

    # Icons
    mkdir -p $out/share/icons/hicolor/1024x1024/apps
    cp share/icons/namida.png $out/share/icons/hicolor/1024x1024/apps/namida.png
    for size in 128 256 512; do
      mkdir -p $out/share/icons/hicolor/"$size"x"$size"/apps
      cp share/icons/namida_$size.png $out/share/icons/hicolor/"$size"x"$size"/apps/namida.png
    done

    # Symlink executable
    mkdir -p $out/bin
    ln -s $out/opt/namida $out/bin/namida

    runHook postInstall
  '';

  meta = {
    description = "";
    homepage = "";
    # license = lib.licenses.; # no idea what license to use here
    maintainers = with lib.maintainers; [ claymorwan ];
  };
})
