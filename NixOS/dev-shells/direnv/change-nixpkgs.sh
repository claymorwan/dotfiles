#!/usr/bin/env sh

scriptdir=$(realpath "$(dirname "$0")")
old_url="https://flakehub.com/f/NixOS/nixpkgs/0.1"
url="nixpkgs/nixos-unstable"

for template in "$scriptdir"/*/; do
  template=${template%*/}
  echo "::Updating $(basename ${template})::" | lolcat
  # echo "use flake" > "$template/.envrc"
  sed -i -e "s|${old_url}|${url}|g" "$template/flake.nix"
done
