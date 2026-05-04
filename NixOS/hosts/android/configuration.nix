{
  environment.etcBackupExtension = ".bak";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "24.05";

  home-manager = {
    config = ../../modules/home;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };
}
