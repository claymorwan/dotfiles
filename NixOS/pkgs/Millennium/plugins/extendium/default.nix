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
    hash = "sha256-izwZ30GKywaJjd0y/POCX0JOdsTdEyNmEdfCxYC53O4=";
    stripRoot = false;
  };

  installPhase = ''
    cp -r extendium $out
  '';

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ claymorwan ];
  };
}
