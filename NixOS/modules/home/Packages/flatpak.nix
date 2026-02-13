{ inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;

    packages = [
      "com.github.tchx84.Flatseal"
      "org.vinegarhq.Sober"
      "io.github.marco_calautti.DeltaPatcher"
      "de.lernsoftware_filius.Filius"
    ];

    overrides = {
      global = {
        Context = {
          filesystems = [
            "xdg-config/gtk-3.0:ro"
            "xdg-config/gtk-4.0:ro"
            "xdg-config/MangoHud/MangoHud.conf:ro"
          ];
        };
      };

      "org.vinegarhq.Sober" = {
        Environment = {
          MANGOHUD = "1";
        };

        Context = {
          filesystems = [
            "xdg-run/discord-ipc-0"
            "xdg-run/app/com.discordapp.Discord:create"
          ];
        };
      };
    };
    update.onActivation = true;
  };
}
