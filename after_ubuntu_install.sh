# update
sudo apt update
sudo apt upgrade



# install chrome
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb



# configure fstab
sudo mkdir /media/antonio/DATA
sudo chown antonio:antonio /media/antonio/DATA
sudo sed -i '/swap.img/d' /etc/fstab 
echo "" | sudo tee -a /etc/fstab
echo "# SWAP /dev/nvme0n1p3 32GM First hard drive" | sudo tee -a /etc/fstab
echo "UUID=f778bd85-3849-4a7f-a1cd-052fc4b52cbd none   swap    sw      0       0" | sudo tee -a /etc/fstab
echo "" | sudo tee -a /etc/fstab
echo "# DATA /dev/nvme1n1p1 2TB SSD Second hard drive" | sudo tee -a /etc/fstab
echo "/dev/disk/by-uuid/af66d7a5-6b28-4953-9b17-55b68d7f946d /media/antonio/DATA ext4 user,rw,noauto 0 2" | sudo tee -a /etc/fstab
echo "" | sudo tee -a /etc/fstab



# install good software
sudo apt install -y conky-all
sudo apt install -y curl
sudo apt install -y git
sudo apt install -y gnome-tweaks gnome-shell-extension-prefs
sudo apt install -y gnome-weather
sudo apt install -y gparted
sudo apt install -y lm-sensors
sudo apt install -y vim

#sudo snap install blender --classic
sudo snap install gimp
#sudo snap install inkscape
sudo snap install intellij-idea-community --classic
sudo snap install kdenlive
#sudo snap install stellarium-daily
sudo snap install vlc
sudo snap install yt-dlg

sudo snap connect gimp:removable-media :removable-media



# remove bad software
sudo apt remove -y rhythmbox
sudo apt autoremove -y

sudo snap remove thunderbird



# configure system
mkdir ~/.config/autostart

# gsettings list-recursively   # to discover stuff
# mouse
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# magic keyboard
#echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode

# desktop
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.screensaver lock-delay 'uint32 1800'
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# gnome-desktop-privacy
gsettings set org.gnome.desktop.privacy old-files-age 'uint32 30'
gsettings set org.gnome.desktop.privacy recent-files-max-age 30
gsettings set org.gnome.desktop.privacy remember-recent-files true
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true

# dock
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 28
gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.TextEditor.desktop', 'intellij-idea-community_intellij-idea-community.desktop', 'gimp_gimp.desktop', 'transmission_transmission.desktop', 'org.gnome.Settings.desktop']"

# gnome-text-editor
gsettings set org.gnome.TextEditor custom-font 'Monospace 10'
gsettings set org.gnome.TextEditor show-line-numbers true
gsettings set org.gnome.TextEditor use-system-font false
gsettings set org.gnome.TextEditor wrap-text false

# gnome-terminal
# click on preference then go on Unnamed and rename it as Antonio. An id will be assigned
profile=`dconf list /org/gnome/terminal/legacy/profiles:/`
dconf write "/org/gnome/terminal/legacy/profiles:/${profile}audible-bell" false
dconf write "/org/gnome/terminal/legacy/profiles:/${profile}use-system-font" false
dconf write "/org/gnome/terminal/legacy/profiles:/${profile}font" "'Monospace 10'"
dconf write "/org/gnome/terminal/legacy/profiles:/${profile}default-size-rows" 45
dconf write "/org/gnome/terminal/legacy/profiles:/${profile}default-size-columns" 90
dconf write "/org/gnome/terminal/legacy/profiles:/${profile}palette" "['rgb(23,20,33)', 'rgb(192,28,40)', 'rgb(38,162,105)', 'rgb(162,115,76)', 'rgb(87,162,254)', 'rgb(163,71,186)', 'rgb(42,161,179)', 'rgb(208,207,204)', 'rgb(94,92,100)', 'rgb(246,97,81)', 'rgb(51,209,122)', 'rgb(233,173,12)', 'rgb(42,123,222)', 'rgb(192,97,203)', 'rgb(51,199,222)', 'rgb(255,255,255)']"



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



### Manual Steps ###

intellij-idea-community
#  - memory indicator
#  - bar on the right


mkdir -p ~/Torrents/Links
# set icon /usr/share/icons/Yaru/48x48/places/insync-folder.png
sudo apt remove transmission-gtk
sudo snap install transmission
#  - Downloading - automatically add links from:Torrents/Links
#  - Downloading - save to location: Torrents
#  - Downloading - append .part: check

# gnome-extensions
gnome-weather   # configure as London; set to celsius
google-chrome https://extensions.gnome.org/extension/779/clipboard-indicator/
google-chrome https://extensions.gnome.org/extension/5470/weather-oclock/



# nordvpn
# hotspot on mobile network (sky blocks nordvpn)
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
sudo groupadd nordvpn
sudo usermod -aG nordvpn $USER
nordvpn login



reboot

