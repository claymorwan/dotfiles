#!/usr/bin/env sh

echo -e "::Yazi plugins::"
ya pkg upgrade

echo -e "::Rust::"
rustup update
echo -e "::Cargo apps::"
cargo install-update --all

echo -e "::Hyprland plugins::"
hyprpm update
