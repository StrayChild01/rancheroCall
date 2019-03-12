#!/bin/bash

RANCHEROCALL_DIR="$HOME/rancheroCall"

cd $RANCHEROCALL_DIR
sudo cp $RANCHEROCALL_DIR/ncidd.blacklist /etc/ncid
sudo systemctl restart ncidd
git add --all
git commit -m "Actualizada lista negra $(date +%Y-%m-%d)"
git push origin master
cd -
