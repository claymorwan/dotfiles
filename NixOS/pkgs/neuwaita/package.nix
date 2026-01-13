{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  kdePackages,
  hicolor-icon-theme,
  gitUpdater,
  color ? null,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "neuwaita-icon-theme";
  version = "unstable-2025-12-04";

  src = fetchFromGitHub {
    owner = "claymorwan";
    repo = "Neuwaita";
    rev = "fix/jetbrains-icon-name-missing";
    hash = "sha256-1fUPpOAh4k0PtbJBIja34Kwi3w1IgdJTzxvItGPnbIQ=";
  };

  propagatedBuildInputs = [
    kdePackages.breeze-icons
    hicolor-icon-theme
  ];

  dontWrapQtApps = true;

  dontDropIconThemeCache = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons/Neuwaita
    mv ./scalable $out/share/icons/Neuwaita

    ${lib.optionalString (color != null) "./change-color.sh ${color}"}

    runHook postInstall
  '';

  passthru.updateScript = gitUpdater { };

  meta = {
    description = "A different take on adwaita theme.";
    homepage = "https://github.com/RusticBard/Neuwaita";
    license = with lib.licenses; [ gpl3Only ];
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [
      claymorwan
    ];
  };
})
