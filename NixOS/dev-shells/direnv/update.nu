#!/usr/bin/env nu

const scripdir = path self | path dirname

for template in (ls -f $scripdir | where type == dir) {
  print ($'::Updating ($template.name | path basename)::' | lolcat -f)
  cd $template.name
  nix flake update
}
