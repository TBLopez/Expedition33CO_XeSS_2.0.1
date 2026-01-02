#!/bin/bash

LATEST_TAG=$(curl -s https://api.github.com/repos/intel/xess/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
VERSION=${LATEST_TAG#v}
URL="https://github.com/intel/xess/releases/download/$LATEST_TAG/XeSS_SDK_$VERSION.zip"

echo "Updating to XeSS $LATEST_TAG..."

# Backup original DLLs and clear path for new ones
DLLS=("libxess.dll" "libxell.dll" "libxess_dx11.dll" "libxess_fg.dll")
for dll in "${DLLS[@]}"; do
    if [ -f "$dll" ]; then
        [ ! -f "$dll.bak" ] && mv "$dll" "$dll.bak" || rm "$dll"
    fi
done

wget -q "$URL" -O "XeSS.zip"
7z e "XeSS.zip" -r -i!'*.dll' -y > /dev/null
rm "XeSS.zip"

[ -f "libxess.dll" ] && echo "Success." || echo "Update failed."
sleep 2
