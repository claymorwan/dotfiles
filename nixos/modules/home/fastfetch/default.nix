{
  programs.fastfetch = {
    enable = true;

    settings = {
    #   logo = {
    #     type = "kitty";
				# source = "./NixOS.png";
				# height = 17;
    #   };

      display = {
        separator = " 󰅂 ";
				color = {
	  		separator = "cyan";
			};
      };

      modules = [
        {
	  			type = "custom";
	  			format = "  System Information";
	  			outputColor = "magenta";
				}
				{
	  			type = "custom";
	  			format = "========================";
	  			outputColor = "magenta";
				}
				{
	  			type = "custom";
	  			format = "󰌢 OS";
	  			outputColor = "red";
				}
				{
	  			type = "os";
	  			key = "├─  Distro";
	  			keyColor = "red";
				}
				{
	  			type = "kernel";
	  			key = "├─  Kernel";
	  			keyColor = "red";
				}
				{
	  			type = "packages";
	  			key = "├─  Package";
	  			keyColor = "red";
				}

				{
	  			type = "custom";
	  			format = " Desktop Environment";
	  			outputColor = "green";
				}
				{
	  			type = "wm";
	  			key = "├─ 󱂬 WM";
	  			keyColor = "green";
				}
				{
	  			type = "wmtheme";
	  			key = "├─ 󰸌 Theme";
	  			keyColor = "green";
				}

				{
	  			type = "custom";
	  			format = " Terminal";
	  			outputColor = "yellow";
				}
				{
	  			type = "shell";
	  			key = "├─  Shell";
	  			keyColor = "yellow";
				}
				{
	  			type = "terminal";
	  			key = "├─  Term";
	  			keyColor = "yellow";
				}

				{
	  			type = "custom";
	  			format = " Hardware";
	  			outputColor = "blue";
				}
				{
	  			type = "cpu";
	  			key = "├─  CPU";
	  			keyColor = "blue";
				}
				{
	  			type = "gpu";
	  			key = "├─ 󰺵 GPU";
	  			keyColor = "blue";
				}
				{
	  			type = "disk";
	  			key = "├─  disk (/)";
	  			keyColor = "blue";
				}
				{
	  			type = "memory";
	  			key = "├─  disk";
	  			keyColor = "blue";
				}
				"break"
				{
	  			type = "custom";
	  			format = " {#90}:3 {#31}:3 {#32}:3 {#33}:3 {#34}:3 {#35}:3 {#36}:3 {#37}:3 {#38}:3 {#39}:3 :3 {#38}:3 {#37}:3 {#36}:3 {#35}:3 {#34}:3 {#33}:3 {#32}:3 {#31}:3 {#90}:3";
				}
      ];
    };
  };
}
