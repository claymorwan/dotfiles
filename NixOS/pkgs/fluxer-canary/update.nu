#!/usr/bin/env nu

let version = http get https://api.canary.fluxer.app/dl/desktop/canary/linux/x64/latest/appimage
  | metadata
  | get http_response.headers
  | where name == 'content-disposition'
  | get value
  | parse --regex '(\d{4}\.\d*\.\d*)'
  | get 0.capture0

let fetcher_hash = nix-prefetch-url $'https://api.canary.fluxer.app/dl/desktop/canary/linux/x64/($version)/appimage'
  | complete
  | get stdout
  | str trim

let sri_hash = nix hash convert --hash-algo sha256 $fetcher_hash

mut package_file = open ./default.nix | into string

let regex_paterns = [
  [patern, replace];
  ['version = "(\d\.\d\.\d+)"', $'version = "($version)"']
  ['hash = "sha256-.{43}="', $'hash = "($sri_hash)"']
]

for _ in $regex_paterns {
  $package_file = $package_file | str replace -r $_.patern $_.replace
}

$package_file | save default.nix -f
