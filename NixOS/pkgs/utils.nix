{
  pkgs ? import <nixpkgs> { },
}:

{
  # timestamp = pkgs.lib.formatSecondsSinceEpoch "%Y-%m-%d" pdfcat-src.lastModified; date +%Y-%m-%d --date @1773859240
  timestamp = src: pkgs.lib.readFile "${pkgs.runCommand "timestamp" {
    env.when = src.lastModified;
  } "echo -n `date -d @$when +%Y-%m-%d` > $out"}";
}
