{
  programs.fastfetch = {
    settings = {
      display = {
        separator = " ";
      };

      modules = [
        {
          type = "custom"; 
          format = "╭──┤ System├──╮";
        }
        
        {
          type = "custom";
          format = "├────┤{#red}󰌢 OS{#}├────┤";
        }
        {
          type = "os";
          key = "│ {#red} Distro{#}     │";
        }
        {
          type = "kernel";
          key = "│ {#red} Kernel{#}     │";
        }
        {
          type = "packages";
          key = "│ {#red} Packages{#}   │";
        }

        {
          type = "custom";
          format = "├────┤{#green} DE{#}├────┤";
        }
        {
          type = "wm";
          key = "│ {#green}󱂬 WM{#}         │";
        }
        {
          type = "theme";
          key = "│ {#green}󰸌 Theme{#}      │";
        }

        {
          type = "custom";
          format = "├─┤{#yellow} Terminal{#}├─┤";
        }
        {
          type = "shell";
          key = "│ {#yellow} Shell{#}      │";
        }
        {
          type = "terminal";
          key = "│ {#yellow} Term{#}       │";
        }

        {
          type = "custom";
          format = "├─┤{#blue} Hardware{#}├─┤";
        }
        {
          type = "cpu";
          key = "│ {#blue} CPU{#}        │";
        }
        {
          type = "gpu";
          key = "│ {#blue}󰺵 GPU{#}        │";
        }
        {
          type = "disk";
          key = "│ {#blue} disk (/){#}   │";
        }
        {
          type = "memory";
          key = "│ {#blue} disk{#}       │";
        }

        {
          type = "custom";
          format = "├──────────────┤";
        }
        {
          type = "colors";
          key = "│  Colors     │";
          symbol = "circle";
        }

        {
          type = "custom";
          format = "╰──────────────╯";
        }
      ];
    };
  };
}
