{ inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  age.secrets = {
    # cloudflared-creds.file = ./cloudflared-creds.json;
  };
}
