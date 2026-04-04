{
  stdenvNoCC,
  lib,
  fetchzip,
}:

stdenvNoCC.mkDerivation rec {
  pname = "extendium";
  version = "2.0.0-beta-4";

  src = fetchzip {
    url = "https://github.com/BossSloth/Extendium/releases/download/v${version}/extendium-${version}.zip";
    hash = "sha256-RcIgJ9fWykBR6qs5F+2eUOQF40+sf/4kMzo9eKAwMUc=";
  };

  installPhase = ''
    # wtf brah
    mkdir -p $out
    cp -r * $out
  '';

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ claymorwan ];
  };
}
