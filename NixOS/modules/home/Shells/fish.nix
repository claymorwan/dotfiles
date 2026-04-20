{ pkgs, config, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellInitLast = ''
      if test "$YAZI_SHELL_SKIP_CMD" != true
        ${config.home.shellAliases.fetch}
      end
    '';
    
    shellAliases = {
      rl = "source ~/.config/fish/config.fish";
    };

    functions = {
      clsc = "clamdscan --fdpass \"$argv\"";
    };

    shellAbbrs = {
      yt-mp3 = "yt-dlp -t mp3 --embed-metadata --embed-thumbnail";

      gpr = "git pull --rebase";
    };

    plugins = [
      {
        name = "git";
        src = pkgs.fishPlugins.git-abbr.src;
      }
      {
        name = "eza";
        src = pkgs.fetchFromGitHub {
          owner = "plttn";
          repo = "fish-eza";
          rev = "36f57936ba3e921334ee313b25c3988258fb9771";
          hash = "sha256-f/JmwxOnLHq/FXIxI424AfOavlmv5/Ep5D2JEm0jFPE=";
        };
      }
      {
        name = "python";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-python";
          rev = "a75de80e68992a922777d9ee36715763aacb8e8b";
          hash = "sha256-2LqZvwLiltrcVVaBsA3sQZsrUnn92El3v/lncHhp3Zo=";
        };
      }
    ];
  };
}
