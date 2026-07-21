# with import <nixpkgs> { };

{
  stdenv,
  lib,
  fetchFromGitHub,
  gradle,
  makeWrapper,
  libappindicator,
  jdk21,
  callPackage,
}:

let
  wayland-lib = callPackage ./wayland-lib.nix { };
in
stdenv.mkDerivation (finalAttrs: {
  pname = "shimelinux";
  version = "1.1.3";

  src = fetchFromGitHub {
    owner = "BujjuIsABee";
    repo = "shimelinux";
    tag = "v${finalAttrs.version}";
    hash = "sha256-oCMwxfLmeO8xJ5IjurBsvAW1C0XDJoWtsbivdZzovIA=";
  };

  nativeBuildInputs = [
    gradle
    makeWrapper
  ];

  buildInputs = [
    libappindicator
  ];
  
  mitmCache = gradle.fetchDeps {
    # inherit (finalAttrs) pname;
    pkg = finalAttrs.finalPackage;
    data = ./deps.json;
  };

  # __darwinAllowLocalNetworking = true;
  doCheck = true;
  gradleFlags = [ "-Dfile.encoding=utf-8" ];

  prePatch = ''
    substituteInPlace ./shimelinux.sh \
      --replace-fail '/usr' $out

    substituteInPlace ./build.gradle.kts \
      --replace-fail 'dependsOn("buildWaylandLib")' "" \
      --replace-fail '$projectDir/shimelinux_wayland/target/release/libshimelinux_wayland.so' '${wayland-lib}/lib/libshimelinux_wayland.so'

    substituteInPlace ./shimelinux.desktop \
      --replace-fail "/usr/bin/" ""
  ''; 

  installPhase = ''
    install -Dm644 build/libs/${finalAttrs.pname}-${finalAttrs.version}.jar $out/share/java/${finalAttrs.pname}.jar
    install -Dm755 ./shimelinux.sh $out/bin/${finalAttrs.pname}

    install -Dm644 ./icon.svg $out/share/icons/hicolor/scalable/apps/${finalAttrs.pname}.svg
    install -Dm644 ./shimelinux.desktop -t $out/share/applications
  
    wrapProgram $out/bin/${finalAttrs.pname} \
      --prefix PATH : ${lib.makeBinPath [ jdk21 ]}
  '';

  meta = {
    description = "An unofficial Linux port of Shimeji-ee Desktop Pet";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ claymorwan ];
    sourceProvenance =  with lib.sourceTypes; [
      fromSource
      binaryBytecode # mitm cache
    ];
  };
})
