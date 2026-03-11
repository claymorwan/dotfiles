#!/usr/bin/env sh

scriptdir=$(realpath "$(dirname "$0")")

for template in "$scriptdir"/*/; do
  template=${template%*/}
  echo "::::Templates $(basename ${template})::::" | lolcat
  $template/update.sh
done
