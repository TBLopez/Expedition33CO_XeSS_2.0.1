# Expedition 33 Clair Obscur XeSS Auto-Updater
Latest XeSS Release Installer shell script for Expedition 33 Clair Obscur

### Usage:

1. Place `update_xess.sh` into the following game subdirectory:  
`Expedition 33/Engine/Plugins/Marketplace/XeSS/Binaries/ThirdParty/Win64`

2. Right-click `update_xess.sh` -> **Properties** -> **Permissions** -> Check **"Is executable"**.

3. Run `update_xess.sh` (Select "Run in Terminal" when prompted).


### Notes:

The script initially queries the GitHub API to identify the latest official release from Intel. It uses native Linux tools (`wget` and `7z`) to fetch the SDK and unpack the archives directly from the official Intel GitHub repository. 

The script automatically backs up the original game DLLs by renaming them with a `.bak` extension before replacing them with the latest versions. It serves as a miniature XeSS swapper that works in any directory where XeSS DLLs are present.
