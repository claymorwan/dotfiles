{
  lib,
  stdenv,
  fetchurl,
  imagemagick,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "omikuji-appimage";
  version = "1.6.7";

  src = fetchurl {
    url = "https://github.com/Twig6943/omikuji/releases/download/${finalAttrs.version}/Omikuji-r35.d58baa7-1-anylinux-x86_64.AppImage";
    hash = "sha256-0JST5n4OhXG2eRP7WcMDXrOtAGKyUjcbYe74i8ZQwt4=";
    executable = true;
    name = "omikuji";
  };

  desktop = fetchurl {
    url = "https://raw.githubusercontent.com/Twig6943/omikuji/refs/tags/${finalAttrs.version}/packaging/io.github.reakjra.omikuji.desktop.in";
    hash = "sha256-McaLdh67SIkX600QUL5by5TxtNvyY7tksgJlKg/FZ1M=";
  };

  icon = fetchurl {
    url = "https://raw.githubusercontent.com/Twig6943/omikuji/refs/tags/${finalAttrs.version}/crates/omikuji/qml/icons/app.png";
    hash = "sha256-vB/qsS9QX8zhNmHhh/xjiQWISXU/auxE9Hav6XNKsoY=";
  };

  dontUnpack = true;
  dontBuild = true;
  dontStrip = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,share}
    
    install -Dm755 $src $out/bin/omikuji

    install -Dm444 ${finalAttrs.desktop} \
      $out/share/applications/io.github.reakjra.omikuji.desktop


    install -Dm444 \
      ${finalAttrs.icon} \
      $out/share/icons/hicolor/512x512/apps/io.github.reakjra.omikuji.png

    for size in 16 24 32 48 64 128 256; do
      mkdir -p $out/share/icons/hicolor/"$size"x"$size"/apps
      ${lib.getExe imagemagick} \
        ${finalAttrs.icon} \
        -resize "$size"x"$size" \
        $out/share/icons/hicolor/"$size"x"$size"/apps/io.github.reakjra.omikuji.png
    done

    runHook postInstall
  '';

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [  ];
  };
})
