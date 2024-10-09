cp /etc/nixos/* .
echo saved config
git add .
git commit -m "updated config"
git push -u origin main
echo commited and pushed to github
cd ~
