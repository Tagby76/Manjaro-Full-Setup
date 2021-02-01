#!/bin/bash

### This shell script is designed to download, install, and setup ALL new software on your Manjaro system. 
### The software to be downloaded and installed is targeted towards Gamers and Users who wish to squeeze as much performance
### out of their Manjaro system as much as possible.

# I mean, that's the idea. But you're probably smarter than me, so you'll make magic. :)

zensu sleep 1
sudo echo " "
echo "BEFORE YOU DO ANYTHING. PLEASE CHANGE YOUR TERMINAL'S SETTINGS TO ALLOW 10,000 LINES. THIS IS DIFFERENT FROM BASH HISTORY."
echo " "
echo "GO DO THAT NOW PLEASE."
sleep 15
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "
echo "WELCOME TO YOUR NEW LINUX GAMING SYSTEM. POWERED BY AMD TECHNOLOGY."
echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "
echo " "
echo " "
sleep 5

echo "LET'S GET STARTED. IN..."
sleep 1
echo "3..."
sleep 1
echo "2..."
sleep 1
echo "1..."
sleep 1
echo " "
echo " "
echo "GO! GO! GO!"
sleep 1


### Here's where the SYSTEM TWEAKS go
echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "
echo "Let's begin by tweaking the system a bit..."
echo " "
echo " "
sleep 4

#Create a hidden bin directory in /Home
echo "CREATING HIDDEN BIN DIRECTORY IN /Home"
sleep 2
echo " "
mkdir -v ~/.bin

echo " "
echo "SUCCESFULLY CREATED ~/.bin"
echo " "
sleep 4

#Bash tweaks:
echo "TWEAKING BASH"
echo " "
sleep 4
echo " " >> ~/.bashrc
echo " " >> ~/.bashrc
echo "### Increase History size" >> ~/.bashrc
echo "HISTSIZE=20000" >> ~/.bashrc
echo "HISTFILESIZE=20000" >> ~/.bashrc
echo " " >> ~/.bashrc
echo "### Adding Neofetch when Bash starts" >> ~/.bashrc
echo "neofetch" >> ~/.bashrc
echo " " >> ~/.bashrc
echo "### Let's tell bash to add ~/.bin to your $PATH" >> ~/.bashrc
#You'll need to add this next line manually to your .bashrc
echo "YOU'LL NEED TO ADD THE NEXT COMMAND MANUALLY TO YOUR .bashrc"
echo export PATH="$HOME/.bin:$PATH"
echo " "
echo " "
sleep 4
source ~/.bashrc
echo $PATH

echo " "
echo "DONE"
sleep 4

### Changing the visudo editor from vi/vim to nano because I'm a human.
echo " "
echo "CHANGING visudo EDITOR TO NANO..."
echo " "
export VISUAL=nano; visudo
echo " "
sleep 4
echo "DONE"

echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "


### Bring the system up to date. 
echo "STARTING PACMAN..."
echo " "
sleep 4

sudo pacman-mirrors --geoip
sudo pacman -Syyuu --noconfirm
sleep 4

echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "



#Enable the Firewall
echo "THE FIREWALL WILL NOW BE ENABLED..."
echo " "
sleep 4

sudo pacman -S --noconfirm ufw
echo "UFW Firewall has been installed"
sudo systemctl enable ufw.service
sudo ufw enable
sleep 4

echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "


##### SOFTWARE ESSENTIALS KIT
echo "INSTALLING SOFTWARE ESSENTIALS"
echo " "
echo " "
sleep 4

###If setting up a modern computer for a family member with plenty of RAM to spare, consider the 'preload' package from the Repositories.

## ABSOLUTE UNIVERSAL ESSENTIALS
#Regardless of your choice of distro, I feel these should just come with every Linux system. Some programs listed here may already be included in your distro.)
#I just want this next line to install the minimumal number of packages needed to make life with paru/trizen easier. Stuff that helps install AUR packages. Help?
sudo pacman -S --verbose --noconfirm paru trizen base-devel fakeroot lib32-fakeroot visudo autoconf automake bison flex m4 cmake make diffutils gcc lib32-gcc-libs manjaro-tools-base manjaro-tools-pkg 


##This next line is entirely up to you. Change it as you wish.
sudo pacman -S --verbose --noconfirm akregator calligra dragon elisa falkon minitube vivaldi vivaldi-ffmpeg-codecs brave chromium stellarium gufw stacer kcolorchooser caffeine-ng bitwarden signal-desktop wire-desktop kdenlive kontact kmail kleopatra kdepim-addons libappindicator-gtk3 lib32-libappindicator-gtk2 aerc mutt libreoffice-fresh bibletime

sudo pacman -S --noconfirm neofetch kitty kitty-terminfo youtube-dl smartmontools ext4magic testdisk photorec plasma-disks vdpauinfo kde-servicemenus-rootactions 
#I really need to organize...
sudo pacman -S --noconfirm exfat-utils exfatprogs ntfs-3g  cmake p7zip p7zip-plugins unrar tar rsync
#Gotta have my fonts!
paru -S --noconfirm ttf-ms-fonts zoom-system-qt skypeforlinux-stable-bin gamehub gotop
# Extend spellchecking abilities
sudo pacman -S --noconfirm aspell-en libmythes mythes-en languagetool
## Maybe this one? Unsure Software goes here:
#sudo pacman -S --noconfirm kde-games-meta kdenlive fragments openshot amarok gnumeric

## Mail Clients available to install:
#sudo pacman -S --noconfirm kontact evolution kmail geary kube
#sudo snap install hiri

## CLI Apps to install:
sudo pacman -S --noconfirm mc mlocate byobu cowfortune sl cowsay cmus atom vdpauinfo cmatrix aview figlet

echo " "
echo " "
echo "List of CLI APPS: mc mlocate byobu fortune cowsay sl cmus atom p7zip unrar tar rsync vdpauinfo smartctl aerc mutt figlet" > ~/Documents/CLI-apps.txt
cat ~/Documents/CLI-apps.txt
# I'll admit, there are probably some good programs that I missed.
sleep 4






### Here's where Snap or Flatpak's stuff goes
echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "
echo "STARTING Snap/Flatpak INSTALLERS..."
echo " "
sleep 4
sudo systemctl enable --now snapd.socket
#flatpak -v install 
#sudo snap install --stable mumble hiri spotify 
#sleep 3





### Here's where the "under the hood" stuff goes, or whatever the hell I think I'm saying. I would like Zen kernels and the AMDVLK package from the official Git repos. I think that would be nice. Couldn't get the linux-zen-git and linux-zen-git-headers to download and install from the AUR. Not sure what I'm doing wrong there.
echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "
echo "TIME TO GET UNDER THE HOOD..."
### It's okay, you can laugh. I understand.
echo " "
sleep 4
#This next line installs the LSI package and some 32bit libraries. I read a post/article somewhere that Steam likes those for Linux. Not entirely sure about that, but what harm could it do? We've got TB of storage, after all.
sudo pacman -S --noconfirm gamemode gtk2 lib32-gtk2 lib32-gamemode linux-steam-integration amd-ucode manjaro-tools-pkg pcre pcre2 lib32-pcre lib32-pcre2 util-linux util-linux-libs lib32-util-linux xz lib32-xz
#If you want AMD bootsplash, I found this package:
#sudo pacman -S --noconfirm bootsplash-theme-amd

#AMDVLK drivers from repos
sudo pacman -S --noconfirm amdvlk lib32-amdvlk
#NVIDIA stuff
#sudo pacman -S --noconfirm nvidia-utils lib32-nvidia-utils
#If you need Vulkan stuff, here ya go:
#sudo pacman -S --noconfirm vulkan-icd-loader lib32-vulkan-icd-loader

echo " "
echo " "
echo "Afterwards, you can check out the Arch Wiki for tips in improving performance:"
echo " "
echo "https://wiki.archlinux.org/index.php/improving_performance"
echo " "
echo " "
echo " "
echo " "
sleep 5
######## I FORGOT ABOVE SECTION, I'LL DO IT LATER.





### Here's where the GAMING STUFF goes.
echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "
echo "GRABBIN' YER GAMING SOFTWARE!"
echo " "
sleep 4
sudo pacman -S --noconfirm lutris playonlinux discord teamspeak3
paru -Sa --noconfirm gamehub

# Insert some wget magic here...


###
echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "



echo "BEGIN CLEAN UP PROCESS"
### CLEAN UP PROCESS
echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "
sleep 5
echo "CREATING REMINDERS..."
## This next section? Change the reminders for whatever you want them to be.
echo " "
sleep 4
echo "1) Don't forget to look into OnlyOffice. Check Repositories, Snap/Flat, and AUR." > ~/Documents/Post-Install-Reminders.txt
echo "2) Reduce the GRUB timeout to zer(0) and add 'GRUB_HIDDEN_TIMEOUT_QUIET=true' underneath TIMEOUT" >> ~/Documents/Post-Install-Reminders.txt
echo "3) Create this file '/etc/sysctl.d/100-manjaro.conf' and add the line 'vm.swappiness=10' to it." >> ~/Documents/Post-Install-Reminders.txt
echo "4) Consider adding cowsay or ponysay after neofetch's line in your ~/.bashrc" >> ~/Documents/Post-Install-Reminders.txt
echo "5) Reboot your system and check to see if your Swappiness is correct value of 10. Use 'cat /proc/sys/vm/swappiness # 10' in the Terminal." >> ~/Documents/Post-Install-Reminders.txt
echo "6) Tweak your Terminal settings for both Konsole and Yakuake. Extend the readback lines to like 10,000 or something." >> ~/Documents/Post-Install-Reminders.txt
echo "7) Add your shell scripts to your Autostart." >> ~/Documents/Post-Install-Reminders.txt
echo "8) This article had a good idea: https://averagelinuxuser.com/manjaro-xfce-after-install/#20-install-popular-apps " >> ~/Documents/Post-Install-Reminders.txt
echo "9) Change your User profile picture if you'd like." >> ~/Documents/Post-Install-Reminders.txt
echo "10) Enable Snap and Flatpak support in Pamac (if you haven't already)." >> ~/Documents/Post-Install-Reminders.txt
echo "11) Consider installing BleachBit or CCleaner for more Maintenance Tools." >> ~/Documents/Post-Install-Reminders.txt
echo "12) Remember to manually add ' export PATH="$HOME/.bin:$PATH" ' phrase to your .bashrc" >> ~/Documents/Post-Install-Reminders.txt
echo "13) Install and configure conky for your desktop." >> ~/Documents/Post-Install-Reminders.txt
echo "14) Don't forget to install the GameJolt and Itch.io clients." >> ~/Documents/Post-Install-Reminders.txt
echo "15) Visit https://wiki.archlinux.org/index.php/improving_performance how to improve system performance." >> ~/Documents/Post-Install-Reminders.txt

echo " " >> ~/Documents/Post-Install-Reminders.txt
echo " " >> ~/Documents/Post-Install-Reminders.txt
echo "All that stuff with 'vm.swappiness' and similar things you're gonna have to search the Internet to make sure those settings are permanent. Or, they'll get wiped the next time you turn off or reboot your computer." >> ~/Documents/Post-Install-Reminders.txt
echo " " >> ~/Documents/Post-Install-Reminders.txt


echo "DON'T FORGET:"
cat ~/Documents/Post-Install-Reminders.txt
sleep 10

echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "

###Time to update Grub and mlocate
echo " "
echo " "
sleep 6
echo "UPDATING grub AND mlocate DATABASE"
echo " "
sleep 4
sudo update-grub
sudo updatedb
echo " "
sleep 2
echo "DONE"
echo " "
sleep 4


echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "

###Good idea to enable TRIM
echo "ENABLING TRIM ON SSD..."
echo " "
sleep 4

sudo systemctl status fstrim.timer # disabled; inactive (default)
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer


echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "

### Make some tweaks to Swappiness and Cache Pressure

sleep 4
echo "TWEAKING YOUR SYSTEM'S SWAPPINESS AND VM CACHE PRESSURE"
echo " "
sleep 4
sudo sysctl vm.swappiness=40
sudo sysctl -a | grep 'vm.swappiness'
sudo sysctl vm.vfs_cache_pressure=50
sudo sysctl -a | grep 'vm.vfs_cache_pressure'
##The next one you will have to set yourself
#sudo sysctl vm.min_free_kbytes=


echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "

echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "
### Update the smartmontools database!
echo "UPDATING THE smartmontools DRIVE DATABASE."
echo " "
sleep 4

sudo update-smart-drivedb -v


sleep 4
echo " "
echo " "
echo "====================================================================================================================================================="
echo " "
echo " "

echo " "
sleep 3
echo "ALL DONE. SCRIPT COMPLETE. REBOOT RECOMMENDED."
echo " "
sleep 4

exit


### Thank you for using, reading, and/or critiquing my shell script. You're awesome.
