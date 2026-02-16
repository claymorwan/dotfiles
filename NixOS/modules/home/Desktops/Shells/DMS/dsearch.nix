{ inputs, ... }:

let
  inherit (import ../../../../../variables)
    home_dir
    ;
in
{
  imports = [ inputs.dsearch.homeModules.default ];

  programs.dsearch = {
    enable = true;

    # Put your config here or omit this for dsearch to generate the default config at runtime
    config = {
      index_paths = {
        path = "${home_dir}";
        max_depth = 6;
        exclude_hidden = false;
        exclude_dirs = [
          # JavaScript/Node.js
          "node_modules"
          "bower_components"
          ".npm"
          ".yarn"

          # Python
          "site-packages"
          "__pycache__"
          ".venv"
          "venv"
          ".tox"
          ".pytest_cache"
          ".eggs"

          # Build outputs
          "dist"
          "build"
          "out"
          "bin"
          "obj"

          # Rust
          "target"

          # Go
          "vendor"

          # Java/JVM
          ".gradle"
          ".m2"

          # Ruby
          "bundle"

          # Cache directories
          ".cache"
          ".parcel-cache"
          ".next"
          ".nuxt"

          # OS specific
          "Library"
          ".Trash-1000"

          # Databases
          ".postgresql"
          ".mysql"
          ".mongodb"
          ".redis"

          # Package manager caches
          "go"
          ".cargo"
          ".pyenv"
          ".rbenv"
          ".nvm"
          ".rustup"

          # IDE/Editor
          ".idea"
          ".vscode"
        ];
      };
    };
  };
}
