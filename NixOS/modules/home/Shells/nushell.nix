{
  inputs,
  lib,
  pkgs,
  config,
  osConfig,
  ...
}:

let
  git-aliases = pkgs.fetchFromGitHub {
    owner = "KamilKleina";
    repo = "git-aliases.nu";
    rev = "2757caa4aa4aeb540d55f872496c77a47ac98afd";
    hash = "sha256-HXb4tGuHSTmZS8uzQG7/Iok7PK031UEYC6WEo401xww=";
  };
in 
{
  programs.nushell = {
    enable = true;

    settings = {
      show_banner = false;
    };

    # extraEnv = lib.concatLines (lib.mapAttrsToList (k: v: "$env.${k} = ${if (lib.isString v) then "'${v}'" else toString v}") config.home.sessionVariables);
    environmentVariables = config.home.sessionVariables;

    extraConfig = ''
      overlay use ${inputs.nu-scripts}/aliases/git/git-aliases.nu
      overlay use ${inputs.nu-scripts}/custom-completions/git/git-completions.nu

      if not ($env.YAZI_SHELL_SKIP_CMD? | default false | into bool) {
        ${osConfig.globVars.shellAliases.fetch}
      }
    '';
  };
}
