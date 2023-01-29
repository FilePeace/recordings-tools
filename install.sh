#!/bin/sh

echo "Installing recordings-tools suite's apps..."

echo "Installing recordings-trimmer..."
cd include/recordings-trimmer
if [ ! -e .git ]; then git clone --no-checkout https://github.com/FilePeace/recordings-trimmer.git .; fi
if [ -e .git ]; then git pull; fi
git checkout -f
chmod +x install.sh && sh ./install.sh
#rm -f install.sh #use noah to exclude everything except .git
#rm -f nu-script-handler
#rm -f Tasks.txt
#rm -f .gitattributes
#rm -f .gitmeta
#rm -rf rsc
cd "$SCRIPTPATH"

echo "Installing recordings-hashing..."
cd include/recordings-hashing
if [ ! -e .git ]; then git clone --no-checkout https://github.com/FilePeace/recordings-hashing.git .; fi
if [ -e .git ]; then git pull; fi
git checkout -f
chmod +x install.sh && sh ./install.sh
cd "$SCRIPTPATH"

echo "Installing recordings-tools..." && echo "- Installing recordings-tools command in /usr/bin..."
sudo cp -f recordings-tools /usr/bin
echo "- Turning recordings-tools into an executable..."
sudo chmod +x /usr/bin/recordings-tools
