{ inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services = {
    flatpak = {
      enable = true;

      # List the Flatpak applications you want to install
      # Use the official Flatpak application ID (e.g., from flathub.org)
      # Examples:
      packages = [
        "com.github.tchx84.Flatseal"
        "org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/25.08"
        #"io.github.flattool.Warehouse"   # Manage flatpaks, clean data, remove flatpaks and deps
      ];

      overrides = {
        global = {
          Context = {
            filesystems = [
              "xdg-config/gtk-3.0:ro"
              "xdg-config/gtk-4.0:ro"
              "xdg-config/MangoHud:ro"
            ];
          };
        };
      };

      update.onActivation = true;
    };
  };
}
