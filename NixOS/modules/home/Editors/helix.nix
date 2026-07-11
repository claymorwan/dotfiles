{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      # Nix
      nil

      # Python
      ruff
      python313Packages.jedi-language-server

      # Qml
      kdePackages.qtdeclarative

      # Markdown
      marksman

      # Lua
      lua-language-server

      # JSON
      vscode-json-languageserver

      # Toml
      taplo

      # Yaml
      yaml-language-server

      # Rust
      rust-analyzer

      # XML
      lemminx

      # C/C++
      clang-tools
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

    languages = {
      language = [
        {
          name = "rust";
          auto-format = false;
        }
        {
          name = "python";
          language-servers = [
            {
              name = "jedi";
              only-features = [ "completion" ];
            }
            "ruff"
          ];
        }
        {
          name = "xml";
          language-servers = [ "lemminx" ];
        }
      ];

      language-server = {
        nil.config.autoEvalInputs = true;
        lemminx.command = "lemminx";
      };
    };
  };
}
