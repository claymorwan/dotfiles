#!/usr/bin/env sh

scriptdir=$(realpath "$(dirname "$0")")

for template in "$scriptdir"/*/; do
  template=${template%*/}
  echo "::Updating $(basename ${template})::" | lolcat
  cd "$template"
  nix flake update
done
