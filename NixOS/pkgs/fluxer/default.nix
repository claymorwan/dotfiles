{
  stdenv,
  autoPatchelfHook,
  makeWrapper,
  glib,
  nspr,
  nss,
  dbus,
  at-spi2-atk,
  cups,
  cairo,
  gtk3,
  pango,
  libX11,
  libXcomposite,
  libXdamage,
  libXext,
  libXtst,
  libXt,
  libXfixes,
  libXrandr,
  libgbm,
  expat,
  libxcb,
  libxkbcommon,
  eudev,
  alsa-lib,
  lib,
  libGL,
  electron_40,
  fetchPnpmDeps,
  pnpmConfigHook,
  pnpm,
  nodejs,
  python3,
  esbuild,
  imagemagick,
  fetchFromGitHub,
  copyDesktopItems,
  makeDesktopItem,
  nix-update-script,
  ...
}:
stdenv.mkDerivation rec {
  pname = "fluxer";
  version = "0-unstable-2026-03-14";

  src = "${
    fetchFromGitHub {
      owner = "fluxerapp";
      repo = "fluxer";
      rev = "03813bbe17db008452f0f1be3090a7d2970a5447";
      sha256 = "sha256-B8V1O1JhoK13yJS29LhTlwltdfh7f2XyzrKjZVdLQVY=";
    }
  }/fluxer_desktop";

  patches = [ ./fluxer.patch ];

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
    pnpmConfigHook
    pnpm
    nodejs
    python3
    esbuild
    copyDesktopItems
  ];

  pnpmDeps = fetchPnpmDeps {
    inherit pname version src;
    fetcherVersion = 3;
    hash = "sha256-Rh84JplYrd9k4fslofQli4fRNKmFhosftUfYXKBKU4g=";
  };

  pnpmInstallFlags = [
    "--frozen-lockfile"
  ];

  buildInputs = [
    glib
    nspr
    nss
    dbus.lib
    at-spi2-atk
    cups.lib
    cairo
    gtk3
    pango
    libX11
    libXcomposite
    libXdamage
    libXext
    libXtst
    libXt
    libXfixes
    libXrandr
    libgbm
    expat
    libxcb
    libxkbcommon
    eudev
    alsa-lib
  ];

  desktopItems = makeDesktopItem {
    name = pname;
    desktopName = "Fluxer";
    comment = "OSS messaging platform";
    exec = pname;
    icon = pname;
    terminal = false;
    type = "Application";
    startupNotify = true;
    startupWMClass = pname;
    categories = [
      "Network"
      "InstantMessaging"
      "Chat"
    ];
  };

  buildPhase = ''
    runHook preBuild

    pnpm run set-channel stable
    pnpm build

    pnpm exec electron-builder --config electron-builder.config.cjs --linux \
    --dir \
    -c.electronDist=${electron_40}/libexec/electron \
    -c.electronVersion=${electron_40.version} \
    -c.npmRebuild=false \

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fluxer
    mkdir -p $out/bin

    cp -r ./dist-electron/linux-unpacked/resources/* $out/share/fluxer

    ls -la ./dist-electron/linux-unpacked/fluxer_desktop
    ls -la ./dist-electron/linux-unpacked/resources

    makeWrapper ${electron_40}/bin/electron $out/bin/fluxer \
    --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ libGL ]}" \
    --add-flags "$out/share/fluxer/app.asar"

    mkdir -p $out/share/icons/hicolor/512x512/
    cp build_resources/icons-stable/512x512.png $out/share/icons/hicolor/512x512/fluxer.png
    for size in 16 24 32 48 64 128 256; do
      mkdir -p $out/share/icons/hicolor/"$size"x"$size"/apps
      ${lib.getExe imagemagick} build_resources/icons-stable/512x512.png -resize "$size"x"$size" $out/share/icons/hicolor/"$size"x"$size"/apps/${pname}.png
    done
    
    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { extraArgs = [ "--version=branch" ]; };

  meta = {
    description = "Free and open source instant messaging and VoIP platform built for friends, groups, and communities";
    homepage = "https://fluxer.app/";
    mainProgram = "fluxer-desktop";
    license = lib.licenses.agpl3Plus;
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
    maintainers = with lib.maintainers; [
      claymorwan
    ];
  };
}

