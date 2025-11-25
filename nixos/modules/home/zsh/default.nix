{ pkgs, lib, host, ... }:

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
      ];
    };

    shellAliases = {
      sv = "sudo nvim";
      cls = "clear";
      fetch = "clear; fastfetch;  blahaj -s -c trans";
      nreload = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#${host} --log-format bar-with-logs";
      nupd = "sudo nixos-rebuild switch --recreate-lock-file --flake ~/.dotfiles/nixos#${host} --log-format bar-with-logs";
    };

    initContent = ''
      clear; fastfetch;  blahaj -s -c trans
    '';


  };
}
