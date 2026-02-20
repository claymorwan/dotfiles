{ pkgs, ... }:

{
  imports = [
    ./dms.nix
    # ./sddm.nix
  ];

  environment.systemPackages = [ (pkgs.callPackage ../../../pkgs/cursors { }) ];
}
