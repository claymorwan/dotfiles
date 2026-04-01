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
