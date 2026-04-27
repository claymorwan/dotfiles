```{.nix #flake-inputs}
fluxer-src = {
  url = "github:fluxerapp/fluxer";
  flake = false;
};

millennium-material-theme-src = {
  url = "github:kuska1/Material-Theme";
  flake = false;
};

beaker-src = {
  url = "git+https://git.bwaaa.monster/beaker?shallow=0";
  flake = false;
};

fluxer-canary-src = {
  url = "https://api.canary.fluxer.app/dl/desktop/canary/linux/x64/latest/appimage";
  flake = false;
};
```

