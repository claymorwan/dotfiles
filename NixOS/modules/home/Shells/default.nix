{ osConfig, host, ... }:

{
  imports = [
    ./fish.nix
    # ./zsh.nix
  ];

  home.shellAliases = {
    nv = "nvim";
    sv = "sudo nvim";
    cls = "clear";
    fetch = "clear; fastfetch";

    nrl = "nh os switch --hostname ${host}";
    nupd = "nh os switch --update --hostname ${host}; ${osConfig.globVars.flake_dir}/dev-shells/update.sh";
    # nreload = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#${host} --log-format bar-with-logs";
    # nupd = "sudo nixos-rebuild switch --recreate-lock-file --flake ~/.dotfiles/nixos#${host} --log-format bar-with-logs";
  };
}
