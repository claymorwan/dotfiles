rec {
  c-cpp = {
    path = ./c-cpp;
    description = "C/C++ development environment";
  };
  c = c-cpp;
  cpp = c-cpp;

  catppuccin = {
    path = ./catppuccin;
    description = "Environment to make catppuccin themes and ports";
  };
  ctp = catppuccin;

  csharp = {
    path = ./csharp;
    description = "C# development environment";
  };
  cs = csharp;

  empty = {
    path = ./empty;
    description = "Empty dev environment";
  };

  kotlin = {
    path = ./kotlin;
    description = "Kotlin development environment";
  };
  kt = kotlin;

  pacman = {
    path = ./pacman;
    description = "Environment to make pacman packages";
  };

  python = {
    path = ./python;
    description = "Python development environment";
  };
  py = python;
}
