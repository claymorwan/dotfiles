Using this to separate my inputs into multiple files, as flake.nix files aren't parsed like regular nix files and cannlt use `import` for inputs
```{.nix file=flake.nix}
{
  description = "NixOS configuration";

  inputs = {
    <<flake-inputs>>
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    let
      username = "claymorwan";
      # system = "x86_64-linux";

      mkNixosConfig =
        host:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            # inherit system;
          };

          modules = [
            ./hosts/${host}
          ];
        };
    in
    {
      templates = import ./dev-shells;
      formatter.x86_64-linux = nixpkgs.legacyPackages."x86_64-linux".nixfmt-tree;
      nixosConfigurations = {
        nixos = mkNixosConfig "nixos";
        nixos-laptop = mkNixosConfig "nixos-laptop";
      };
    };
}
```
