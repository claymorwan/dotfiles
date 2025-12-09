{
  programs.starship = {
    enable = true;

    settings = {
      format = "$os$username$hostname 󰜥 $directory 󰜥 [](bold fg:yellow)$cmd_duration$status"
        + "$c$dotnet$haxe$lua$rust$zig$dart$golang$nodejs$php$java$kotlin$haskell$python$docker_context[](fg:prev_bg)"
        +''
        $git_branch
        $character
      '';

      character = {
        success_symbol = "[  ](bold fg:blue)";
        error_symbol = "[  ](bold fg:red)";
      };

      package = {
        disabled = true;
      };

      git_branch = {
        style = "bg: cyan";
        symbol = "󰘬";
        truncation_length = 12;
        truncation_symbol = "";
        format = " 󰜥 [](bold fg:cyan)[$symbol $branch(:$remote_branch)](fg:black bg:cyan)[ ](bold fg:cyan)";
      };

      git_commit = {
        commit_hash_length = 4;
        tag_symbol = " ";
      };

      git_state = {
        format = "[\($state( $progress_current of $progress_total)\)]($style) ";
        cherry_pick = "[🍒 PICKING](bold red)";
      };

      git_status = {
        conflicted = " 🏳 ";
        ahead = " 🏎💨 ";
        behind = " 😰 ";
        diverged = " 😵 ";
        untracked = " 🤷 ‍";
        stashed = " 📦 ";
        modified = " 📝 ";
        staged = "[++\($count\)](green)";
        renamed = " ✍️ ";
        deleted = " 🗑 ";
      };
      
      line_break ={
        disabled = false;
      };

      memory_usage = {
        disabled = true;
        threshold = -1;
        symbol = " ";
        style = "bold dimmed green";
      };

      time = {
        disabled = true;
        format = "🕙[\[ $time \]]($style) ";
        time_format = "%T";
      };

      username = {
        style_user = "bold bg:cyan fg:black";
        style_root = "red bold";
        format = "[](bold fg:cyan bg:prev_bg)[$user]($style)";
        disabled = false;
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format =  "[•$hostname](bg:cyan bold fg:black)[](bold fg:cyan)";
        trim_at = ".companyname.com";
        disabled = false;
      };

      directory = {
        home_symbol = "  ";
        read_only = "  ";
        style = "bg:green fg:black";
        truncation_length = 6;
        truncation_symbol = " ••/";
        format = "[](bold fg:green)[󰉋 $path]($style)[](bold fg:green)";
      };

      directory.substitutions = {
        "Desktop" = "  ";
        "Documents" = "  ";
        "Downloads" = "  ";
        "Music" = " 󰎈 ";
        "Pictures" = "  ";
        "Videos" = "  ";
        "GitHub" = " 󰊤 ";
      };

      cmd_duration = {
        min_time = 0;
        format = "[󰪢 $duration](bold bg:yellow fg:black)"; #[](bold fg:yellow)";
      };

      status = {
        disabled = false;
        style = "yellow";
        symbol = " ";
        failure_style = "red";
        success_symbol = " ";
        success_style = "green";
        not_executable_symbol = " ";
        not_found_symbol = " ";
        format = "[](fg:yellow bg:$style)[ $symbol](fg:crust bg:$style)";
      };

      os = {
        disabled = false;
        style = "surface0";
        format = "[]($style)[$symbol](fg:text bg:$style)";
      };

      os.symbols = {
        AlmaLinux = " ";
        Alpine = " ";
        Amazon = " ";
        Android = " ";
        Arch = "󰣇 ";
        Artix = " ";
        CentOS = " ";
        Debian = "󰣚 ";
        EndeavourOS = " ";
        Fedora = "󰣛 ";
        FreeBSD = " ";
        Garuda = " ";
        Gentoo = "󰣨 ";
        Illumos = " ";
        Kali = " ";
        Linux = "󰌽 ";
        Macos = "󰀵 ";
        Manjaro = " ";
        Mint = "󰣭 ";
        NixOS = " ";
        Nobara = " ";
        OpenBSD = " ";
        OracleLinux = " ";
        Pop = " ";
        Raspbian = " ";
        Redhat = "󱄛 ";
        RedHatEnterprise = "󱄛 ";
        RockyLinux = " ";
        Solus = " ";
        SUSE = " ";
        Ubuntu = "󰕈 ";
        Unknown = " ";
        Void = " ";
        Windows = "󰍲 ";
      };

      # Programming languages
      bun = {
        symbol = " ";
        style = "rosewater";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      nodejs = {
        symbol = "";
        style = "green";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      c = {
        symbol = " ";
        style = "lavender";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      dotnet = {
        symbol = " ";
        style = "mauve";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      haxe = {
        symbol = " ";
        style = "peach";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      lua = {
        symbol = " ";
        style = "blue";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      zig = {
        symbol = " ";
        style = "yellow";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      dart = {
        symbol = " ";
        style = "sky";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      rust = {
        symbol = " ";
        style = "red";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      golang = {
        symbol = " ";
        style = "blue";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      php = {
        symbol = " ";
        style = "mauve";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      java = {
        symbol = " ";
        style = "peach";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      kotlin = {
        symbol = " ";
        style = "mauve";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      haskell = {
        symbol = "";
        style = "mauve";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      python = {
        symbol = " ";
        style = "green";
        format = "[](fg:prev_bg bg:$style)[ $symbol($version)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };

      docker_context = {
        symbol = "";
        style = "blue";
        format = "[](fg:prev_bg bg:$style)[ $symbol($context)](fg:crust bg:$style)[](fg:$style bg:$style)";
      };
    };
  };
}
