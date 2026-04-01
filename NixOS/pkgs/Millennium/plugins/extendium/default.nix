{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
  extendium-src,
  local-utils,
}:

stdenvNoCC.mkDerivation {
  pname = "extendium";
  version = "0-unstable-${local-utils.timestamp extendium-src}";

  src = extendium-src;

  installPhase = ''
    mkdir -p $out/extendium
    cp -r * $out/extendium
  '';

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ claymorwan ];
  };
}
