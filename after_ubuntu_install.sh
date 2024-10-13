# update
sudo apt update
sudo apt upgrade



# install chrome
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb



# configure fstab
mkdir /media/antonio/DATA
sudo chown antonio:antonio DATA
echo "" | sudo tee -a /etc/fstab
echo "# DATA /dev/nvme1n1p1 2TB SSD Second hard drive" | sudo tee -a /etc/fstab
echo "/dev/disk/by-uuid/af66d7a5-6b28-4953-9b17-55b68d7f946d /media/antonio/DATA ext4 user,rw,noauto 0 2" | sudo tee -a /etc/fstab



# install good software
sudo apt install -y conky-all
sudo apt install -y curl
sudo apt install -y git
sudo apt install -y gnome-tweaks gnome-shell-extension-prefs
sudo apt install -y gnome-weather
sudo apt install -y gparted
sudo apt install -y lm-sensors
sudo apt install -y vim

sudo snap install blender --classic
sudo snap install gimp
sudo snap install inkscape
sudo snap install intellij-idea-community --classic
sudo snap install vlc



# remove bad software
sudo apt remove -y rhythmbox
sudo apt autoremove -y

sudo snap remove -y thunderbird



# configure system
mkdir ~/.config/autostart

# - gsettings list-recursively   # to discover stuff
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface clock-show-seconds true

# dock
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 28
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', 'intellij-idea-community_intellij-idea-community.desktop', 'gimp_gimp.desktop', 'blender_blender.desktop', 'snap-store_snap-store.desktop', 'org.gnome.Settings.desktop']"

# gnome-text-editor
gsettings set org.gnome.TextEditor custom-font 'Monospace 10'
gsettings set org.gnome.TextEditor show-line-numbers true
gsettings set org.gnome.TextEditor use-system-font false
gsettings set org.gnome.TextEditor wrap-text false

# gnome-terminal
profile=`dconf list /org/gnome/terminal/legacy/profiles:/`
dconf write "/org/gnome/terminal/legacy/profiles:/${profile}use-system-font" false
dconf write "/org/gnome/terminal/legacy/profiles:/${profile}font" "'Monospace 10'"
dconf write "/org/gnome/terminal/legacy/profiles:/${profile}default-size-rows" 40
dconf write "/org/gnome/terminal/legacy/profiles:/${profile}default-size-columns" 100



# intellij
#  - memory indicator
#  - bar on the right
# nordvpn
#  - signin



# conky
sudo cp conky/* /etc/conky/
echo "[Desktop Entry]" >> ~/.config/autostart/conky.desktop
echo "Type=Application" >> ~/.config/autostart/conky.desktop
echo "Name=conky" >> ~/.config/autostart/conky.desktop
echo "Comment=Start Conky on login" >> ~/.config/autostart/conky.desktop
echo "Exec=/etc/conky/startup-conky.sh" >> ~/.config/autostart/conky.desktop
echo "StartupNotify=false" >> ~/.config/autostart/conky.desktop
echo "Terminal=false" >> ~/.config/autostart/conky.desktop
echo "Icon=conky-logomark-violet" >> ~/.config/autostart/conky.desktop
echo "Categories=System;Monitor;" >> ~/.config/autostart/conky.desktop



# ssh
cp _ssh/* ~/.ssh



# git projects
printf 'Insert your email for git: '
read gitEmail
git config --global user.email "$gitEmail"
git config --global user.name "Antonio Alonzi"	
git config --global core.editor "vim"

mkdir -p ~/Projects/antonioalonzi
git clone git@github.com:antonioalonzi/scripts.git ~/Projects/antonioalonzi/scripts



reboot



### Manual Steps ###

# gnome-extensions
gnome-weather   # configure as London; set to celsius
google-chrome https://extensions.gnome.extension/org/779/clipboard-indicator/   # click install
google-chrome https://extensions.gnome.org/extension/5470/weather-oclock/

