{ pkgs, ... }:

{
  services.flatpak = {
    # enable = true;
    packages = [
      "org.vinegarhq.Sober"
    ];

    overrides = {
      "org.vinegarhq.Sober".Context = {
        filesystems = [
          "xdg-run/discord-ipc-0"
          "xdg-run/app/com.discordapp.Discord:create"
        ];
      };
    };
  };
}
