{ pkgs, ... }: 

{
  services = {
    flatpak = {
      enable = true;

      # List the Flatpak applications you want to install
      # Use the official Flatpak application ID (e.g., from flathub.org)
      # Examples:
      packages = [
        "com.github.tchx84.Flatseal"
        "app.zen_browser.zen"
        # "com.valvesoftware.Steam"
        # "net.lutris.Lutris"
        #"com.github.tchx84.Flatseal" #Manage flatpak permissions - should always have this
        #"com.rtosta.zapzap"              # WhatsApp client
        #"io.github.flattool.Warehouse"   # Manage flatpaks, clean data, remove flatpaks and deps
        #"it.mijorus.gearlever"           # Manage and support AppImages
      ];

      overrides = {
        global = {
          Context = {
            filesystems = [
              "xdg-config/gtk-3.0"
              "xdg-config/gtk-4.0"
            ];
          };
        };
      };

      update.onActivation = true;
    };
  };
}

