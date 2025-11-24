{ pkgs, lib, host, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" "regexp" "root" "line" ];
    };
    historySubstringSearch.enable = true;

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
      sv = "sudo nvim";
      cls = "clear";
      fetch = "clear; fastfetch;  blahaj -s -c trans";
      nreload = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#${host} --log-format bar-with-logs";
      nupd = "sudo nixos-rebuild switch --recreate-lock-file --flake ~/.dotfiles/nixos#${host} --log-format bar-with-logs";
    };

  };
}
