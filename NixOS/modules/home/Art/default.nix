{ pkgs, ... }:

{
  programs = {
    krita = {
      enable = true;

      plugins = [
        (pkgs.fetchFromGitHub {
          owner = "veryprofessionaldodo";
          repo = "Krita-UI-Redesign";
          rev = "80ae45c34fdcedf3c9972d6ee16e591cc3f7efcf";
          hash = "sha256-TAAtaYua5uLrffM2c6wB2gvCo4c8NLT5DArskI8djTY=";
        })

        (pkgs.fetchFromGitHub {
          owner = "Firstbober";
          repo = "krita-rpc";
          rev = "c30e920f7f1a7636013407e9817671835d136436";
          hash = "sha256-gNI3kQnMeZfme+Ly/1tH9tHoqoAzUliQXa5BmpFCj+Y=";
        })

        ("${pkgs.fetchFromGitLab {
          domain = "invent.kde.org";
          owner = "freyalupen";
          repo = "reference-tabs-docker";
          rev = "4e9723566c6f6772758067b247b86556a72de242";
          hash = "sha256-L/7tA6o4lrYJZfoiaEsstlP3FQdPkl/QdD+Ihq2kpgk=";
        }}/pykrita")
      ];
    };
  };

  home.packages = with pkgs; [
    aseprite
    blockbench
    blender
    kdePackages.kdenlive
    # davinci-resolve
    # openshot-qt
  ];
}
