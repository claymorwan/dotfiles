{ lib, stdenvNoCC }:

stdenvNoCC.mkDerivation {
  pname = "akita-neru";
  version = "0-unstable-2025-12-30";

  src = ./.icons/Akita-Neru-X/cursors;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/Akita-Neru/cursors
    cp -r dist/* $out/share/icons/Akita-Neru/cursors
    runHook postInstall
  '';

  meta = {
    description = "Cursor yayyy";
    # homepage = "";
    # license = ;
    # maintainers = with lib.maintainers; [  ];
  };
}
