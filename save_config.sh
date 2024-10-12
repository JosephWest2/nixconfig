#!/bin/bash
cp /etc/nixos/* ~/.dotfiles/nixosgit
git add .
git commit -m "updated config"
git push -u origin main
find -maxdepth 1 ~/.dotfiles/nixosgit -type f ! -name "save_config.sh" -delete
