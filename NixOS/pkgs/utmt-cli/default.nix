{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  git,
  dotnetCorePackages,
}:

# with import <nixpkgs> { };

buildDotnetModule (finalAttrs: {
  pname = "utmt-cli";
  version = "0.9.1.1";

  src = fetchFromGitHub {
    owner = "UnderminersTeam";
    repo = "UndertaleModTool";
    tag = finalAttrs.version;
    hash = "sha256-bsV4q75rwo9Grqaqp9U1WaySahdoQMZSA1F06mfoyoA=";
    leaveDotGit = true;
    deepClone = true;
    fetchSubmodules = true;
  };

  projectFile = "UndertaleModCli/UndertaleModCli.csproj";
  nugetDeps = ./deps.json;
  dotnet-sdk = dotnetCorePackages.sdk_10_0;
  dotnet-runtime = dotnetCorePackages.runtime_10_0;
  packNupkg = true;
  buildType = "Debug";
  selfContainedBuild = true;
  executables = [
    "UndertaleModCli"
  ];

  nativeBuildInputs = [
    git
  ];

  postFixup = ''
    ln -s $out/bin/UndertaleModCli $out/bin/utmt
  '';

  meta = {
    description = "The most complete tool for modding, decompiling and unpacking Undertale (and other GameMaker games!)";
    homepage = "https://github.com/UnderminersTeam/UndertaleModTool";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ claymorwan ];
    mainProgram = "utmt";
  };
})
