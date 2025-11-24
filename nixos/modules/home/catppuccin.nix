{ inputs, ... }:

{
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    nvim.enable = false;
  };
}
