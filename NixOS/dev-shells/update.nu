#!/usr/bin/env nu

const scripdir = path self | path dirname

cd $'($env.NH_FLAKE)/..'
devenv update

for template in (ls -f $scripdir | where type == dir) {
  print ($'::::Templates ($template.name | path basename)::::' | lolcat -f)
  run-external $'($template.name)/update.nu'
}
