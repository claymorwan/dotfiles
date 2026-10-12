let
  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILxeSzz3JpElnuSMsM2LnkadpexP7zmXIL5gz+5/W6ck";
in
{
  "pink.tar.gz.age".publicKeys = [ nixos ];
}
