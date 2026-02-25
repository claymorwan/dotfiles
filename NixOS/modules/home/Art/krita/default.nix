{ pkgs, ... }:

let
  krita-plugins = [
    (pkgs.fetchFromGitHub {
      owner = "veryprofessionaldodo";
      repo = "Krita-UI-Redesign";
      rev = "df37ade2334b09ca30820286e3e16c26b0fbb4f8";
      hash = "sha256-kGs1K2aNIiQq//W8IQ2JX4iyXq43z2I/WnI8aJjg8Yk=";
    })

    (pkgs.fetchFromGitHub {
      owner = "Firstbober";
      repo = "krita-rpc";
      rev = "c30e920f7f1a7636013407e9817671835d136436";
      hash = "sha256-gNI3kQnMeZfme+Ly/1tH9tHoqoAzUliQXa5BmpFCj+Y=";
    })
  ];
in 
{
  home.packages = with pkgs; [
    # krita
  ];

  xdg.dataFile = {
    "krita/pykrita" = {
      enable = true;
      source = pkgs.symlinkJoin {
        name = "pykrita";
        paths = krita-plugins;
      };
      recursive = true;
    };
  };
}
