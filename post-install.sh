#! /bin/bash
clear
echo " Post-Install script"
echo ""
echo " Add to Linux Mint Mate 19.3 32-bit additional reposorories"
echo " LibreOffice ver.7+, Foliate, RHVoice, Grub-Customizer"
echo " Add RHVoice script (Russian TTS) for Foliate, Keyboard layout flag indicator script"
echo ""
echo "-----------------------------"
echo " Backup /etc/apt/sources.list"
echo "-----------------------------"
echo ""
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
echo ""
echo "----------------------------------------"
echo " Script - Keyboard layout flag indicator"
echo "----------------------------------------"
echo ""
#sudo apt install dconf-editor
#org->mate->desktop->peripherals->keyboard->indicator
# info: https://linuxmint.com.ru/viewtopic.php?t=1448
mkdir -p ~/.icons/flags
ln -s /usr/share/iso-flag-png/* ~/.icons/flags
gsettings set org.mate.peripherals-keyboard-xkb.indicator show-flags "true"
echo ""
echo "---------------------------------------------------------------------------------"
echo " Add repositories: LibreOffice 7, Foliate, Grub-Customizer,RHVoice, Latvian repos"
echo "---------------------------------------------------------------------------------"
echo ""
# echo "deb https://apache.bintray.com/couchdb-deb $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list
# repogenerator - https://mirrors.ustc.edu.cn/repogen/
sudo add-apt-repository 'deb http://ppa.launchpad.net/apandada1/foliate/ubuntu bionic main'
# deb-src http://ppa.launchpad.net/apandada1/foliate/ubuntu bionic main
sudo add-apt-repository 'deb http://ppa.launchpad.net/apandada1/foliate-daily/ubuntu bionic main'
# deb-src http://ppa.launchpad.net/apandada1/foliate-daily/ubuntu bionic main
sudo add-apt-repository 'deb http://ppa.launchpad.net/danielrichter2007/grub-customizer/ubuntu bionic main'
# deb-src http://ppa.launchpad.net/danielrichter2007/grub-customizer/ubuntu bionic main
sudo add-apt-repository 'deb http://ppa.launchpad.net/libreoffice/libreoffice-7-0/ubuntu bionic main'
# deb-src http://ppa.launchpad.net/libreoffice/libreoffice-7-0/ubuntu bionic main
sudo add-apt-repository 'deb http://ppa.launchpad.net/libreoffice/libreoffice-prereleases/ubuntu bionic main'
# deb-src http://ppa.launchpad.net/libreoffice/libreoffice-prereleases/ubuntu bionic main
sudo add-apt-repository 'deb http://ppa.launchpad.net/libreoffice/libreoffice-still/ubuntu bionic main'
# deb-src http://ppa.launchpad.net/libreoffice/libreoffice-still/ubuntu bionic main
sudo add-apt-repository 'deb http://ppa.launchpad.net/libreoffice/ppa/ubuntu bionic main'
# deb-src http://ppa.launchpad.net/libreoffice/ppa/ubuntu bionic main
sudo add-apt-repository 'deb http://ppa.launchpad.net/linvinus/rhvoice/ubuntu bionic main'
# deb-src http://ppa.launchpad.net/linvinus/rhvoice/ubuntu bionic main
sudo add-apt-repository 'deb http://ftp.linux.edu.lv/mirrors/packages.linuxmint.com tricia main upstream import backport'
sudo add-apt-repository 'deb http://ubuntu.koyanet.lv/ubuntu bionic main restricted universe multiverse'
sudo add-apt-repository 'deb http://ubuntu.koyanet.lv/ubuntu bionic-updates main restricted universe multiverse'
sudo add-apt-repository 'deb http://ubuntu.koyanet.lv/ubuntu bionic-backports main restricted universe multiverse'
sudo add-apt-repository 'deb http://security.ubuntu.com/ubuntu/ bionic-security main restricted universe multiverse'
sudo add-apt-repository 'deb http://archive.canonical.com/ubuntu/ bionic partner'
echo ""
echo "--------------------"
echo " Update repositories" 
echo "--------------------"
echo ""
sudo apt update
echo ""
echo "-------------------------------------------------------------------------------"
echo " Install progs: nano, elinks, gedit, mc, vlc, grub-customizer, foliate" 
echo " libreoffice, psensor, chromium, gparted"
echo "-------------------------------------------------------------------------------"
echo ""
sudo apt install nano elinks gedit mc vlc grub-customizer foliate libreoffice psensor chromium gparted
echo ""
echo "-----------------------------------"
echo " Install RHVoice Russian TTS script" 
echo "-----------------------------------"
echo ""
mkdir -p ~/.local/foliate && cd ~/.local/foliate
echo "#! /bin/bash
# RHVoice-test -p aleksandr
# anna, aleksandr, sit
if [[ $FOLIATE_TTS_LANG_LOWER == 'ru' ]];
then
  RHVoice-test -p aleksandr -r 100 <&0 &
else
  RHVoice-test -p slt <&0 &
fi

trap 'kill $!; exit 0' INT
wait" > rhvoice.sh && chmod +x rhvoice.sh
exit


































