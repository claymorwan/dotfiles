{ ... }:

{
  programs.mangohud = {
    enable = true;

    settingsPerApplication = {
      java = {
        position = "top-left";
      };
    };
  };
}
