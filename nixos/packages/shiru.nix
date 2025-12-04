{
  stdenv,
  nodejs,
  # This is pinned as { pnpm = pnpm_9; }
  pnpm,
  fetchzip,
  lib
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "shiru";
  version = "6.4.1";

  src = fetchzip {
    url = "https://github.com/RockinChaos/Shiru/archive/refs/tags/v6.4.1.tar.gz";
    hash = "sha256-sha256-aYr5nCGEkYE27ZjODqltsSR7kY9YBwnqbt4qcRwt8TE=";
  };

  nativeBuildInputs = [
    nodejs
    pnpm.configHook
  ];

  pnpmWorkspaces = [ "./*" ];
  pnpmDeps = pnpm.fetchDeps {
    inherit (finalAttrs) pname version src pnpmWorkspaces;
    fetcherVersion = 2;
    hash = "...";
  };

  meta = with lib; {
    description = "Shiru";
    homepage = "https://github.com/RockinChaos/Shiru";
    license = licenses.gpl3;
    platforms = platforms.linux;
    # maintainers = with maintainers; [ otavio ];
  };
})

