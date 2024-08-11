#### To kill and restart gnome shell in terminal
# killall -3 gnome-shell

#### To log terminal, type exit when done
# script screen.log
# exit

#### for ranger in .bashrc
# alias ranger='source ranger'

#### fzf for zsh, put in .zshrc
# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh

#### fzf for bash, put in .bashrc
# source /usr/share/fzf/key-bindings.bash
# source /usr/share/fzf/completion.bash

#### Incase you need it
# sudo apt install ./*deb
# sudo dpkg -i ./*deb
# sudo dpkg --force-all -i ./*deb
# sudo rm ./*deb
# --download-only --install-suggests

# sudo dpkg --remove kdeconnect
# sudo dpkg --purge kdeconnect

#### Update####
sudo apt update
sudo apt upgrade
sudo apt update
sudo add-apt-repository universe

#### Gnome Tweaks
sudo apt --download-only install gnome-tweaks

#### Extension-manager####
sudo apt --download-only install gnome-shell-extension-manager

#### Open as administrator
sudo apt install nautilus-admin

#### ZSH
sudo apt install zsh

#### Package managers
sudo apt --download-only install synaptic
sudo apt --download-only install gdebi
sudo apt --download-only install git

#### Multimedia Codecs
#No nned
# sudo apt --download-only install ubuntu-restricted-extras

#Android
sudo apt --download-only install only scrcpy

#### Xbox
sudo apt --download-only install xboxdrv

#### PS4 (check if it work without sysd and 118,119 issue)
sudo apt --download-only install python3-pip
sudo pip download ds4drv

#### Game Cheat
sudo pip install scanmem

#### Art and Graphics design
sudo apt --download-only install gimp krita drawing inkscape blender gcolor3

#### Video, Audio and Media-tools
sudo apt --download-only install vlc haruna mpv clementine libprojectm-dev libprojectm2v5 libvisual-projectm projectm-data gnome-subtitles

#Other Vid
#cozy blanket strawberry

#### Media Productivity
sudo apt --download-only install audacity obs-studio kdenlive handbrake

#### Accesibility
sudo apt --download-only install gnome-pie

#Others media
# kooha (no need) ciano (no need, minimal video and audio converter)

#### Network Tools
sudo apt --download-only install btop htop bmon iftop nethogs slurm net-tools ncat nmap

#### Other Network Tools
#ss-dev e2fsprogs netcat lsof qjournalctl languagetool

#Cli Tools
sudo apt --download-only install neofetch ranger nnn exa fd-find f3 locate ripgrep neovim bat exa zoxide nnn fzf

#Disk apps
sudo apt --download-only install testdisk gddrescue ddrescueview

#### Terminal
sudo apt --download-only install tilix
sudo apt --download-only install konsole
sudo apt --download-only install tmux

#### geany
sudo apt --download-only install geany geany-plugins

#### Docs and PDF
sudo apt --download-only install okular pdfarranger pdfcrack comparepdf meld colordiff kdiff3 kdiff3-doc pandoc libghc-pandoc-doc recoll imagemagick rename gprename

##### sublimetext
##### Add Sublime GPG key, Add Sublime Repository, Update System Packages, Install the Sublime Text Editor
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublimetext-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/sublimetext-keyring.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt --download-only install sublime-text

#### Other Docs and PDF
#kate

#### Dowload tools
sudo apt --download-only install yt-dlp youtube-dl youtubedl-gui aria2 axel qbittorrent persepolis

#### Ocr Tools
sudo apt --download-only install ocrfeeder ocrmypdf ocrmypdf-doc cuneiform tesseract-ocr tesseract-ocr-eng tesseract-ocr-ara tesseract-ocr-chi-sim tesseract-ocr-chi-tra tesseract-ocr-fra tesseract-ocr-deu tesseract-ocr-jpn

#### Firewall
#opensnitch: download the main deb and ui-deb
sudo apt install ./opensnitch*.deb ./python3-opensnitch-ui*.deb

#workarround for ui error ubuntu 22.04
python3.10 -m pip install --ignore-installed grpcio

#start opensnitch
opensnitch-ui
#or
sudo systemctl enable opensnitch; sudo systemctl start opensnitch

#### Python
sudo apt --download-only install python3-pip python3-wheel python3-setuptools python3-installer python3-build python3-pyudev python3-evdev python-evdev-doc python-setuptools

##### Keyboard Applications
sudo apt --download-only install onboard

##### Optional dependencies for file-roller
#sudo apt-get --install-suggests --install-recommends install file-roller
sudo apt --download-only install rar unrar lrzip lrzip squashfs-tools unace

Theme
#sudo apt --download-only install qt5-style-kvantum

#### WINE ####

#### My Lutris Method (yes)
sudo dpkg --add-architecture i386 && sudo apt update && sudo apt --download-only install wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386 ttf-mscorefonts-installer dosbox winetricks playonlinux exe-thumbnailer wine-binfmt wine32-preloader:i386 wine64-preloader

#### After installed package run winecfg in terminal to generate configuration file. And, run the bellow command to make link the .desktop file  (yes)
winecfg
sudo ln -s /usr/share/doc/wine/examples/wine.desktop /usr/share/applications/

#### Hyper Light Drifter Deps (yes)
sudo dpkg --add-architecture i386 && sudo apt-get --download-only install libc6:i386 libasound2:i386 libasound2-data libasound2-plugins:i386 libcurl4:i386 libgtk2.0-0:i386 libopenal1:i386 libglu1-mesa:i386

#undertale
libcrypto.so.1.0.0

libXxf86vm.so.1


#####################################################################################

#### My Method (No)
sudo apt update
#sudo apt upgrade
sudo dpkg --add-architecture i386
sudo apt-get --download-only --install-suggests --install-recommends install wine64
sudo apt-get --download-only --install-suggests --install-recommends install wine32
sudo apt --download-only install mono-complete
sudo apt-get --download-only --install-recommends install winetricks
sudo apt-get --download-only --install-recommends install playonlinux
sudo apt --download-only install lutris

#### After installed package run winecfg in terminal to generate configuration file. And, run the bellow command to make link the .desktop file  (yes)
winecfg
sudo ln -s /usr/share/doc/wine/examples/wine.desktop /usr/share/applications/

#### WINE Deps  (No)
sudo apt install ttf-mscorefonts-installer

#### Lutris Method (No)
sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386

##### GeggRoll (No)
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
sudo apt update
sudo apt install --install-recommends winehq-staging
sudo apt install winetricks


##############(Arch, No)#############################################################

sudo apt install --dry-run	alsa-plugins	cups	dosbox	ffmpeg	giflib	gnutls	gst-plugins-bad	gst-plugins-base	gst-plugins-base-libs	gst-plugins-good	gst-plugins-ugly	gtk3	lib32-alsa-lib	lib32-alsa-plugins	lib32-giflib	lib32-gnutls	lib32-gst-plugins-base	lib32-gst-plugins-base-libs	lib32-gtk3	lib32-gst-plugins-good	lib32-libcups	lib32-libgcrypt	lib32-libgpg-error	lib32-libjpeg-turbo	lib32-libldap	lib32-libpng	lib32-libpulse	lib32-libva	lib32-libxcomposite	lib32-libxinerama	lib32-libxslt	lib32-mpg123	lib32-ncurses	lib32-openal	lib32-sqlite	lib32-ocl-icd	lib32-pcsclite	lib32-sdl2	lib32-v4l-utils	lib32-vulkan-icd-loader	libgphoto2	libgcrypt	libgpg-error	libjpeg-turbo	libldap	libpng	libpulse	libva	libxcomposite	libxinerama	libxslt	mpg123	ncurses	ocl-icd	pcsclite	openal	samba-libs	sane	sdl2	unixodbc	v4l-utils	vulkan-icd-loader	wine-gecko	wine-mono

###################################################################################




#### Games
sudo apt --download-only install gnome-2048 gnome-chess gnome-mahjongg gnome-mines gnome-sudoku quadrapassel aisleriot
