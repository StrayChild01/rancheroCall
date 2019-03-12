#!/bin/bash

sudo cp $HOME/rancheroCall/ncidd.blacklist /etc/ncid
sudo systemctl restart ncidd
git add --all
git commit -m "Actualizada lista negra $(date +%Y-%m-%d)"
git push origin master
