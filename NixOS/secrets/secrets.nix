let
  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILxeSzz3JpElnuSMsM2LnkadpexP7zmXIL5gz+5/W6ck";
  nixos-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBji+J9N3EXFBP1ROoMMgn3ErgJN9CiOK1+9JDAbOnZm";

in
{
  # "cloudflared-creds.json".publicKeys = [ nixos nixos-laptop ];
}
