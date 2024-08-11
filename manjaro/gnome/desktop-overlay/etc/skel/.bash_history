ll
ls
cd
cd ..
cd ~
clear
sudo !!
whereis
starship preset bracketed-segments -o ~/.config
starship preset gruvbox-rainbow -o ~/.config/starship.toml
starship preset pastel-powerline -o ~/.config/starship.toml
starship preset tokyo-night -o ~/.config/starship.toml
gsettings set org.gnome.desktop.interface document-font-name 'Sans 12'
gsettings set org.gnome.desktop.interface font-name 'Inter Nerd Font Propo 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'FiraCode Nerd Font Mono weight=453 12'
pip install ./*whl
pip download
pip install
echo $SHELL && echo "Prints the path to the login shell (may not be the actual shell in use)"
echo $0 && echo "Prints the path to the a actual shell in use"
bash && echo "Temporarily switching to bash shell"
zsh && echo "Temporarily switching to zsh shell"
fish && echo 'Temporarily switching to fish shell'
chsh -s /bin/zsh && echo 'Now log out and log back in to change shell to zsh.'
chsh -s /bin/bash && echo 'Now log out and log back in to change shell to bash.'
chsh -s /bin/fish && echo 'Now log out and log back in to change shell to fish.'
source .zshrc
nvim
fc-cache -fv && echo '!!!! Reloading font cache
micro -plugin list
micro -help
micro -plugin available
micro
fuzp
fuz
makepkg
pacud
pacu
clear
pamac list
sudo pacman -U -d ./*zst
sudo pacman -U ./*zst
