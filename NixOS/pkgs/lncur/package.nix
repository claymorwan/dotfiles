{
  lib,
  python3Packages,
  fetchFromGitHub,

  # build-system
  hatch,

  versionCheckHook,
  nix-update-script,
}:

python3Packages.buildPythonApplication rec {
  pname = "lncur";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "claymorwan";
    repo = "${pname}";
    rev = "v${version}";
    hash = "sha256-J6mucNUpmgZrQ7iMqh1cdc0gY0GuXwpzlx9QPgUfhtg=";
  };

  build-system = with python3Packages; [
    hatch
  ];

  nativeCheckInputs = [
    versionCheckHook
  ];
  versionCheckProgram = "${placeholder "out"}/bin/lncur";

  passthru = {
    updateScript = nix-update-script { };
  };

  meta = {
    changelog = "https://github.com/claymorwan/lncur/releases/tag/v${version}";
    description = "Python CLI easily symlink files when porting Windows cursors to Linux ";
    homepage = "https://github.com/claymorwan/lncur";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      claymorwan
    ];
  };
}
