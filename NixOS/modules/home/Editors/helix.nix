{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nil
      ruff
      kdePackages.qtdeclarative
      marksman
      lua-language-server
      vscode-json-languageserver
      taplo
      yaml-language-server
    ];

    settings = {
      editor = {
        cursor-shape.insert = "bar";
        clipboard-provider = "wayland";
        file-picker = {
          hidden = false;
          deduplicate-links = false;
        };
      };

      keys.normal = {
        "C-s" = ":w";
        "C-q" = ":q";
      };
    };
  };
}
