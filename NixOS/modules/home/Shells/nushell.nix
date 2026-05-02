{
  inputs,
  lib,
  pkgs,
  config,
  osConfig,
  ...
}:

let
  shellAliases = lib.filterAttrs (n: v: !lib.strings.hasInfix ";" v) osConfig.globVars.shellAliases;
  functions = lib.filterAttrs (n: v: lib.strings.hasInfix ";" v) osConfig.globVars.shellAliases;
in 
{
  programs.nushell = {
    enable = true;

    shellAliases = shellAliases;

    settings = {
      show_banner = false;
      hooks.display_output = "table --expand --icons";
    };

    environmentVariables = config.home.sessionVariables;

    extraConfig = ''
      overlay use ${inputs.nu-scripts}/aliases/git/git-aliases.nu
      overlay use ${inputs.nu-scripts}/custom-completions/git/git-completions.nu

      # ls -s ${inputs.nu-scripts}/custom-completions
      #   | each {|n|
      #     source ${inputs.nu-scripts}/custom-completions/($n.name)/($n.name)-completions.nu
      #   }

      ${lib.concatLines (lib.mapAttrsToList (k: v: "def ${lib.hm.nushell.toNushell { } k} [] { ${v} }") functions)}

      if not ($env.YAZI_SHELL_SKIP_CMD? | default false | into bool) {
        ${osConfig.globVars.shellAliases.fetch}
      }
    '';
  };
}
