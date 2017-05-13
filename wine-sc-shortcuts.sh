#!/bin/bash

# SET PATH VARIABLES
SC_WINE_PATH=$(echo $HOME)/.wine-starcraft
SC_WINE_INSTALL_PATH=${SC_WINE_PATH}
SC_WINE_BIN_PATH=${SC_WINE_INSTALL_PATH}/wine-staging/bin
SC_WINE_PREFIX=${SC_WINE_PATH}/sc-prefix

SC_WINE_URL=${SC_WINE_DOWNLOAD_SITE}/wine-staging.tar.gz
SC_ICON_URL=${SC_WINE_DOWNLOAD_SITE}/starcraft-icon.png
SC_WINECFG_ICON_URL=${SC_WINE_DOWNLOAD_SITE}/winecfg-icon.png

SC_INSTALL_DIR=$(dirname "$(find ${SC_WINE_PREFIX}/drive_c | grep StarCraft.exe)")

echo "Creating StarCraft.desktop"
#--- create StarCraft launcher on desktop ---
cat << EOF > "$HOME/Desktop/StarCraft.desktop"
[Desktop Entry]
Name=StarCraft
Exec=env WINEPREFIX="${SC_WINE_PREFIX}" ${SC_WINE_BIN_PATH}/wine StarCraft.exe
Type=Application
StartupNotify=true
Comment=Play StarCraft
Path=${SC_INSTALL_DIR}
Icon=${SC_WINE_PATH}/starcraft-icon.png
EOF

echo "Creating WineConfig.desktop"
#--- create StarCraft launcher on desktop ---
cat << EOF > "$HOME/Desktop/SCWineConfig.desktop"
[Desktop Entry]
Name=StarCraft WineCfg
Exec=env WINEPREFIX="${SC_WINE_PREFIX}" ${SC_WINE_BIN_PATH}/winecfg
Type=Application
StartupNotify=true
Comment=Wine StarCraft Configuration
Icon=${SC_WINE_PATH}/winecfg-icon.png
EOF

chmod 755 "${HOME}/Desktop/StarCraft.desktop"
chmod 755 "${HOME}/Desktop/SCWineConfig.desktop"


cat << EndOfMessage
##############################################
##############################################



    You should now 2 new icons on your desktop.
    
    > StarCraft
    > StarCraft WineCfg

    Using 'StarCraft WineCfg' browse for 'StarCraft.exe', set it to 'Windows XP' and enable 'Hide Wine version from applications' setting under staging tab. 
    
    'Add Application' > Browse 'Program Files (x86)\StarCraft' > Select 'StarCraft.exe' > OK
    
    Leave 'Default Settings' Windows version as 'Windows 7' otherwise, you'll get crash messages and Battle.net will fail to load.

    If you need help, please check the screenshots here: http://imgur.com/a/qz1GN




##############################################
##############################################
EndOfMessage