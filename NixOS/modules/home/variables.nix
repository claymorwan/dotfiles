{ lib, config, osConfig, ... }:

let
  cfg = config.globVars;
  
  mkStrVar = var:
    lib.mkOption {
      type = lib.types.str;
      default = var;
    };
    
  discordExeName = versions:
    "discord" + (lib.findFirst (x: builtins.isString x) "" versions); # (lib.optionalString (version != "stable") version);
in
{
  options.globVars = {
    # Apps
    # launch_prefix = mkStrVar "app2unit --";
    terminal = mkStrVar "ghostty";
    browser = mkStrVar "zen-beta";

    discord = mkStrVar (discordExeName config.programs.nixcord.discord.branches);
  };
}
