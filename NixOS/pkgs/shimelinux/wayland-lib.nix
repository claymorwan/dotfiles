{
  rustPlatform,
  pkg-config,
  libxkbcommon,
  callPackage,
}:

let
  shimelinux = callPackage ./default.nix { };
in
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "${shimelinux.pname}-wayland-lib";
  inherit (shimelinux) version;

  src = "${shimelinux.src}/shimelinux_wayland";

  # cargoHash = "sha256-m1ZzbB9gEj7lSEweD6TnmpfD01VLAOCYU944gaVyKK0=";

  cargoLock.lockFile = "${finalAttrs.src}/Cargo.lock";
  
  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    libxkbcommon
  ];
})
