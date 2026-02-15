{ stdenvNoCC }:

let
  inherit (import ../../variables)
    mouse_cursor
    ;
in
stdenvNoCC.mkDerivation {
  pname = "${mouse_cursor}";
  version = "0-unstable-2025-12-30";

  src = ./cursors/${mouse_cursor};

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/${mouse_cursor}
    cp -r ./* $out/share/icons/${mouse_cursor}
    runHook postInstall
  '';

  meta = {
    description = "Cursor yayyy";
  };
}
