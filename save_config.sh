cp /etc/nixos/* ~/.dotfiles/nixosgit
echo saved config
git add .
git commit -m "updated config"
git push -u origin main
echo commited and pushed to github
ls ~/.dotfiles/nixosgit | grep -xv 'save_config.sh' | xargs rm
