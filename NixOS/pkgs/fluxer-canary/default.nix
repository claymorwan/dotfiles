{
  lib,
  fetchurl,
  fluxer-canary-src,
  appimageTools,
  makeDesktopItem,
}:

let
  pname = "fluxer-canary-appimage";
  version = "0.0.44";
  
  src = fluxer-canary-src;

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };

  desktopItem = makeDesktopItem {
    name = "fluxer-canary";
    desktopName = "Fluxer Canary";
    comment = "Chat, voice, and video with your communities on Fluxer.";
    exec = "fluxer-canary-appimage %U";
    icon = "fluxer";
    terminal = false;
    type = "Application";
    startupNotify = true;
    startupWMClass = "fluxer-canary";
    mimeTypes = [
      "x-scheme-handler/fluxer-canary"
    ];

    categories = [
      "Network"
      "InstantMessaging"
      "Chat"
    ];
  };

in 
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${desktopItem}/share/applications/*.desktop \
      $out/share/applications/fluxer.desktop

    for size in 16 24 32 48 64 128 256 512; do
      install -Dm444 \
        ${appimageContents}/resources/icons/"$size"x"$size".png \
        $out/share/icons/hicolor/"$size"x"$size"/apps/fluxer.png
    done

  '';

  meta = {
    description = "Free and open source instant messaging and VoIP platform.";
    homepage = "https://canary.fluxer.app/";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ claymorwan ];
  };
}
