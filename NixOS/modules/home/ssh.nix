{
  programs.ssh = {
    enable = true;

    extraConfig = ''
      Host codeberg.org
	      IdentityFile ~/.ssh/codeberg
	      User git
      Host github.com
	      IdentityFile ~/.ssh/github
	      User git     
    '';
  };
}
