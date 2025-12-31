{ pkgs, ... }:

{
  home.packages = with pkgs; [
    krita
  ];

  xdg.dataFile = {
    "krita/pykrita" = {
      enable = true;
      source = pkgs.fetchFromGitHub {
        owner = "veryprofessionaldodo";
        repo = "Krita-UI-Redesign";
        rev = "df37ade2334b09ca30820286e3e16c26b0fbb4f8";
        hash = "sha256-kGs1K2aNIiQq//W8IQ2JX4iyXq43z2I/WnI8aJjg8Yk=";
      };
      recursive = true;
    };
  };
}
