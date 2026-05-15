let latest_table = http get https://api.github.com/repos/Twig6943/omikuji/releases/latest

let tag = $latest_table
  | get tag_name

let filename = $latest_table
  | get assets
  | where name =~ '(.*)AppImage'
  | get name.0

let regex_patterns = [
  [patern, replace];
  ['version = "(\d\.\d\.\d+)"', $'version = "($tag)"']
  ['https://github.com/Twig6943/omikuji/releases/download/\${finalAttrs.version}/Omikuji-.*.AppImage', $'https://github.com/Twig6943/omikuji/releases/download/${finalAttrs.version}/($filename)']
];

mut package_file = open ./default.nix | into string

for _ in $regex_patterns {
  $package_file = $package_file | str replace -r $_.patern $_.replace
}

$package_file | save default.nix -f
