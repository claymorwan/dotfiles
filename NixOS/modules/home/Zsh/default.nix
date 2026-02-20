{
  pkgs,
  lib,
  host,
  config,
  ...
}:

let
  fetch_cmd = "clear; fastfetch;";
  inherit (import ../../../variables)
  flake_dir
  ;
in
{
  programs.zsh = {
    enable = true;

    dotDir = "${config.xdg.configHome}/zsh";

    enableCompletion = false;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
        "pattern"
        "regexp"
        "root"
        "line"
      ];
    };
    historySubstringSearch.enable = true;

    plugins = [
      {
        name = "zsh-autocomplete";
        src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "25.03.19";
          hash = "sha256-eb5a5WMQi8arZRZDt4aX1IV+ik6Iee3OxNMCiMnjIx4=";
        };
      }
      {
        name = "zsh-eza";
        src = pkgs.fetchFromGitHub {
          owner = "z-shell";
          repo = "zsh-eza";
          rev = "baf28b07fd9d601de701eff0c7ccac3f53f6c9ef";
          hash = "sha256-wsPbH9S9mh/DH6g6lYBRRve53q0XH0mM5HZ6H/ndUsA=";
        };
      }
    ];

    history = {
      ignoreDups = true;
      save = 10000;
      size = 10000;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "python"
        "man"
      ];
    };

    shellAliases = {
      rl = "source ~/.config/zsh/.zshrc";
      nv = "nvim";
      sv = "sudo nvim";
      cls = "clear";
      fetch = "${fetch_cmd}";

      nrl = "nh os switch --hostname ${host}";
      nupd = "nh os switch --update --hostname ${host}; ${flake_dir}/dev-shells/update.sh";
      # nreload = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#${host} --log-format bar-with-logs";
      # nupd = "sudo nixos-rebuild switch --recreate-lock-file --flake ~/.dotfiles/nixos#${host} --log-format bar-with-logs";
    };

    initContent = ''
      if [[ "$YAZI_SHELL_SKIP_CMD" != true ]]; then
        ${fetch_cmd}
      fi
    '';
  };
}
