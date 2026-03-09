rec {
  c-cpp = {
    path = ./direnv/c-cpp;
    description = "./direnv/C++ development environment";
  };
  c = c-cpp;
  cpp = c-cpp;

  catppuccin = {
    path = ./direnv/catppuccin;
    description = "Environment to make catppuccin themes and ports";
  };
  ctp = catppuccin;

  csharp = {
    path = ./direnv/csharp;
    description = "C# development environment";
  };
  cs = csharp;

  empty = {
    path = ./direnv/empty;
    description = "Empty dev environment";
  };

  kotlin = {
    path = ./direnv/kotlin;
    description = "Kotlin development environment";
  };
  kt = kotlin;

  pacman = {
    path = ./direnv/pacman;
    description = "Environment to make pacman packages";
  };

  python = {
    path = ./direnv/python;
    description = "Python development environment";
  };
  py = python;
}
