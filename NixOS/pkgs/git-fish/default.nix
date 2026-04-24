{
  lib,
  fishPlugins,
  fetchFromGitHub,
}:

fishPlugins.buildFishPlugin {
  pname = "git-fish";
  version = "1.0.0-unstable-2026-04-23";

  src = ./git;

  meta = {
    description = "Abbreviations, aliases and functions for git for the fish shell from the git omz plugin";
    homepage = "";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ claymorwan ];
  };
}
