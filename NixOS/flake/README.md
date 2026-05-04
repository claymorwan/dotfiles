Using this to separate my inputs into multiple files, as flake.nix files aren't parsed like regular nix files and cannlt use `import` for inputs
```{.nix file=flake.nix}
{
  description = "NixOS configuration";

  inputs = {
    <<flake-inputs>>
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nix-on-droid,
      ...
    }:
    let
      username = "claymorwan";
      # system = "x86_64-linux";

      mkNixosConfig = host: let
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit self;
          # inherit system;
        };

        config = {
          modules = [
            ./hosts/${host}
            ./variables
          ];
        };
      in 
        if (host == "android") then
          nix-on-droid.lib.nixOnDroidConfiguration (config // { pkgs = import nixpkgs { system = "aarch64-linux"; extraSpecialArgs = specialArgs; }; })
        else
          nixpkgs.lib.nixosSystem (config // { specialArgs = specialArgs; });
    in
    {
      templates = import ./dev-shells;
      formatter.x86_64-linux = nixpkgs.legacyPackages."x86_64-linux".nixfmt-tree;
      nixosConfigurations = {
        nixos = mkNixosConfig "nixos";
        nixos-laptop = mkNixosConfig "nixos-laptop";
      };
      nixOnDroidConfigurations.android = mkNixosConfig "android";
    };
}
```
