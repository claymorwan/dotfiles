{
  description = "Evironment to make pacman/arch packages";

  # Flake inputs
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    archix = {
      url = "github:SamLukeYes/archix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Flake outputs
  outputs =
    inputs:
    let
      # The systems supported for this flake
      supportedSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
      ];

      # Helper to provide system-specific attributes
      forEachSupportedSystem =
        f:
        inputs.nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import inputs.nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShell {
            # The Nix packages provided in the environment
            # Add any you need here
            packages = with pkgs; [
              pacman
              paru
              fakeroot
              inputs.archix.packages.${system}.devtools
            ];

            # Set any environment variables for your dev shell
            env = {
              CHROOT = "/mnt/media/Programmation/Arch"; # builtins.toString ./.; # doesn't work yet
            };

            # Add any shell logic you want executed any time the environment is activated
            shellHook = ''
              if [ ! -d "root" ]; then
                mkarchroot $CHROOT/root base-devel
              fi
            '';
          };
        }
      );
    };
}
