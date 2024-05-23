@echo off

rmdir /S /Q assets
curl https://github.com/covector/CMC-MobArena-Textures/archive/refs/heads/master.zip -L --ssl-no-revoke -o cmc-mobarena-texture-temp.zip
tar -xf cmc-mobarena-texture-temp.zip
xcopy .\CMC-MobArena-Textures-master\* .\ /E /H /C /Y
rmdir /S /Q CMC-MobArena-Textures-master
del cmc-mobarena-texture-temp.zip
del .gitignore