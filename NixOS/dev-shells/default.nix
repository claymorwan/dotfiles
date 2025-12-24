rec {
  catppuccin = {
    path = ./catppuccin;
    description = "Environment to make catppuccin themes and ports";
  };

  ctp = catppuccin;
  
  empty = {
    path = ./empty;
    description = "Empty dev environment";
  };
  
  pacman = {
    path = ./pacman;
    description = "Environment to make pacman packages";
  };
  
  python = {
    path = ./python;
    description = "Python development environment";
  };
}
