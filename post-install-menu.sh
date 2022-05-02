#######Create functions
# Script for Linux Mint 19.3 Mate 32-bit
#!/bin/bash
function backup_sources_list {
clear
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
echo "Done!"
}
function kbd_flags_indicator {
clear
#sudo apt install dconf-editor
#org->mate->desktop->peripherals->keyboard->indicator
# info: https://linuxmint.com.ru/viewtopic.php?t=1448
mkdir -p ~/.icons/flags
ln -s /usr/share/iso-flag-png/* ~/.icons/flags
gsettings set org.mate.peripherals-keyboard-xkb.indicator show-flags "true"
}
function add_repos {
clear
echo "Add libreoffice 7, foliate, rhvoice, grub-customizer and Latvian oficial repos"
echo "for Linux Mint 19.3 Mate 32-bit"
# echo "deb https://apache.bintray.com/couchdb-deb $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list
# repogenerator - https://mirrors.ustc.edu.cn/repogen/
echo 'deb http://ppa.launchpad.net/apandada1/foliate/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ppa.launchpad.net/apandada1/foliate-daily/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ppa.launchpad.net/danielrichter2007/grub-customizer/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ppa.launchpad.net/libreoffice/libreoffice-7-0/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ppa.launchpad.net/libreoffice/libreoffice-prereleases/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ppa.launchpad.net/libreoffice/libreoffice-still/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ppa.launchpad.net/libreoffice/ppa/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ppa.launchpad.net/linvinus/rhvoice/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ftp.linux.edu.lv/mirrors/packages.linuxmint.com tricia main upstream import backport' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ubuntu.koyanet.lv/ubuntu bionic main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ubuntu.koyanet.lv/ubuntu bionic-updates main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
echo 'deb http://ubuntu.koyanet.lv/ubuntu bionic-backports main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
echo 'deb http://security.ubuntu.com/ubuntu/ bionic-security main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
echo 'deb http://archive.canonical.com/ubuntu/ bionic partner' | sudo tee -a /etc/apt/sources.list
/*
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
*/
}
function update_apt
 {
clear
sudo apt update && sudo apt upgrade -y
}
function install_progs {
clear
echo "Install Grub-Cuctomizer, Foliate, RHVoice, gparted"
echo "Libre Office 7+, vlc, mc, nano, gedit, elinks, chromium"
echo ""
sudo apt install nano elinks gedit mc vlc grub-customizer foliate libreoffice psensor chromium gparted
}
function install_rhvoice_tts {
clear
echo "start installing..."
mkdir -p ~/.local/foliate
cd ~/.local/foliate
echo "#! /bin/bash
# RHVoice-test -p aleksandr     # Enough this string in Foliate settings for RHVoice TTS work.
# anna, aleksandr, sit
if [[ $FOLIATE_TTS_LANG_LOWER == 'ru' ]];
then
  RHVoice-test -p aleksandr -r 100 <&0 &
else
  RHVoice-test -p slt <&0 &
fi

trap 'kill $!; exit 0' INT
wait" > rhvoice.sh
chmod +x rhvoice.sh
echo "Done!"
}

######Create menu
function menu {
clear
echo
echo -e "\t\t\tPost-Install script menu\n"
echo -e "\t1. Backup Sources.list"
echo -e "\t2. Install keyboard layout flags indicator script"
echo -e "\t3. Add repositories (see more)"
echo -e "\t4. Update & upgrade rpositories"
echo -e "\t5. Install progs (see more)"
echo -e "\t6. Install RHVoice Russian TTS script"
echo -e "\t0. Exit"
echo -en "\t\tEnter menu position: "
read -n 1 option
}
######Use While loop and Case command for menu creation.
while [ $? -ne 1 ]
do
        menu
        case $option in
0)
        break ;;
1)
        backup_sources_list ;;
2)
        kbd_flags_indicator ;;
3)
        add_repos ;;
4)
        update_apt ;;
5)
        install_progs ;;
6)
        install_rhvoice_tts ;;
*)
        clear
echo "Need select menu position ";;
esac
echo -en "\n\n\t\t\tPress any keyboard button to continue"
read -n 1 line
done
clear
