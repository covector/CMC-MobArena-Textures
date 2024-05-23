#!/bin/bash

rm -r ./assets
curl https://github.com/covector/CMC-MobArena-Textures/archive/refs/heads/master.zip -L --ssl-no-revoke -o cmc-mobarena-texture-temp.zip
# REQUIRES UNZIP
unzip -o cmc-mobarena-texture-temp.zip
cp -r CMC-MobArena-Textures-master/* .
rm -r ./CMC-MobArena-Textures-master
rm cmc-mobarena-texture-temp.zip