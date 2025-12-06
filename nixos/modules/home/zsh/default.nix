{ pkgs, lib, host, ... }:

let
  fetch_cmd = "clear; fastfetch;  blahaj -s -c trans";
in 
{
  programs.zsh = {
    enable = true;

    enableCompletion = false;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" "regexp" "root" "line" ];
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
        "eza"
      ];
    };

    shellAliases = {
      rl = "source ~/.zshrc";
      nv = "nvim";
      sv = "sudo nvim";
      cls = "clear";
      fetch = "${fetch_cmd}";

      nrl = "nh os switch --hostname ${host}";
      nupd = "nh os switch --update --hostname ${host}";
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
