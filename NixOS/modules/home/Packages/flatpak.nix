{ pkgs, ... }:

{
  services.flatpak = {
    packages = [
      "org.vinegarhq.Sober"
      "io.github.marco_calautti.DeltaPatcher"
    ];

    overrides = {
      "org.vinegarhq.Sober".Context = {
        filesystems = [
          "xdg-run/discord-ipc-0"
          "xdg-run/app/com.discordapp.Discord:create"
        ];
      };
    };
    update.onActivation = true;
  };
}
