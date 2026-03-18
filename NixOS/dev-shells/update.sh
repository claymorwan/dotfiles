#!/usr/bin/env sh

scriptdir=$(realpath "$(dirname "$0")")

cd $NH_FLAKE/..
devenv update
for template in "$scriptdir"/*/; do
  template=${template%*/}
  echo "::::Templates $(basename ${template})::::" | lolcat
  $template/update.sh
done
