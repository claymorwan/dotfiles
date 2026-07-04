#!/usr/bin/env bash

nix build --expr "with import <nixpkgs> { }; (callPackage ./. { }).passthru.fetch-deps" --impure
./result
rm ./result
