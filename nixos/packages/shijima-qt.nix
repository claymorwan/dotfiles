{ stdenv, qt6, fetchFromGitHub
, pkg-config, wayland-protocols, wayland}:

stdenv.mkDerivation {
  pname = "shijima-qt";
  version = "0.2.0-alpha1";

  src = fetchFromGitHub {
  owner = "claymorwan";
  repo = "Shijima-Qt";
  rev = "a022c957d9b18fac579d9ca344b56df1ac41420f";
  hash = "sha256-j89gmQMWvX7iukkTkOMZ46WXoUtWHNC+bht7mAeXWPE=";
  };

  buildInputs = [ qt6.qtbase qt6.qtmultimedia ];
  nativeBuildInputs = [ qt6.wrapQtAppsHook pkg-config wayland-protocols ];

}
# { stdenv, lib
# , fetchurl
# , alsaLib
# , openssl
# , zlib
# , pulseaudio
# , autoPatchelfHook
# }:
#
# stdenv.mkDerivation rec {
#   pname = "shijima-qt";
#   version = "0.2.0-alpha1a";
#
#   src = fetchurl {
#     url = "https://download.studio.link/releases/v${version}-stable/linux/studio-link-standalone-v${version}.tar.gz";
#     hash = "sha256-4CkijAlenhht8tyk3nBULaBPE0GBf6DVII699/RmmWI=";
#   };
#
#   nativeBuildInputs = [
#     autoPatchelfHook
#   ];
#
#   buildInputs = [
#     alsaLib
#     openssl
#     zlib
#     pulseaudio
#   ];
#
#   sourceRoot = ".";
#
#   installPhase = ''
#     runHook preInstall
#     install -m755 -D studio-link-standalone-v${version} $out/bin/studio-link
#     runHook postInstall
#   '';
#
#   meta = with lib; {
#     homepage = "https://studio-link.com";
#     description = "Voip transfer";
#     platforms = platforms.linux;
#   };
# }
