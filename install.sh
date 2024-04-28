#!/bin/bash

# ---------------------
# SOFTWARE INSTALLATION 
# ---------------------
echo "Installing requirements..."
sudo zypper refresh && sudo zypper install git gh bspwm picom polybar neovim nitrogen sxhkd alacritty firefox

echo "Installing development environment..."
sudo zypper install maven python go java gcc nodejs npm

# --------------
# AUTHORIZATIONS
# --------------

echo "Login to github: "
gh auth login

echo "Before continuing, please login to your firefox account."
read -rp "Press Enter to continue" </dev/tty

# -------------
# COPY DOTFILES
# -------------

echo "Copying dotfiles..."

for file in ./.config/*; do
    cp -rf "$file" "$HOME/.config/"
done

for file in ./.fonts/*; do
    sudo cp -rf "$file" /usr/share/fonts/
done

cp ./.ssh/config "$HOME/.ssh/config"

cp ./.wallpapers "$HOME/.wallpapers"

# -----
# BSPWM
# -----

echo "Setting bspwmrc as executable..."

cd "$HOME/.config/bspwm/" || exit

chmod +x bspwmrc

# ------
# NEOVIM
# ------

echo "Installing neovim plugins..."

cd "$HOME/.config/nvim/lua/sebas/" || exit

nvim packer.lua +so +PackerSync

# ------------- 
# SET WALLPAPER
# -------------

echo "Setting wallpaper..."

PS3='Select a wallpaper: '
options=("$HOME"/.wallpapers/*)
select opt in "${options[@]}"
do
    nitrogen --set-centered "$opt"
    break
done

# ------------
# SSH GIT KEYS
# ------------

echo "Creating ssh keys for git..."
cd "$HOME/.ssh/" || exit
ssh-keygen -t ed25519 -C "sebas.services99@gmail.com" -f "githubKey"
ssh-keygen -t rsa -b 4096 -C "sebastiao.sousa@tecnico.ulisboa.pt" -f "gitlabTecnicoKey"

echo "Authorize github account: "
gh auth refresh -h github.com -s admin:public_key

read -rp "Enter github ssh key title: " title
gh ssh-key add github.pub -t "$title"


echo "Before continuing, please add the key named gitlabTecnicoKey to tecnico gitlab."
read -rp "Press Enter to continue" </dev/tty

# -------------------------
# DOCUMENTS DIRECTORY SETUP
# -------------------------

echo "Setting up Documents directory..."
mkdir -p "$HOME/Documents/personalProjects/"
mkdir -p "$HOME/Documents/test/"

cd "$HOME/Documents/personalProjects" || exit

gh repo clone Art-Link
gh repo clone myTextEditor

cd "$HOME/Documents/test/" || exit

touch test.c test.cpp test.java test.js test.py test.go test.sh
chmod +x test.sh
mkdir go output
cd go || exit

go mod init test

cd "$HOME/Documents/" || exit

git clone --recurse-submodules git@github.com:SRSAS/faculdade.git
