#!/bin/bash

white='\033[0;37m'
NC='\033[0m'
clear
printf '\033]2; INSTALLER\a'
echo -e "Press \e[1;33many key\e[0m to install the script..."
read -n 1 
clear

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$DIR" != "/root/reconX" ]]
then
	echo -e "I will try to install it for you..."
	sleep 4
	if [[ -d /root/reconX ]]
	then 
		rm -r /root/reconX
	fi
	mkdir /root/reconX
	cp -r "$DIR"/* /root/reconX
	chmod +x /root/reconX/install.sh
	#gnome-terminal -- bash -c "sudo /root/autoxploit/install.sh; exec bash"
fi
echo -e "Installing Recon-X..."
sleep 1
echo -e "Fixing permissions..."
sleep 2
chmod +x /root/reconX/reconX.sh
clear
echo -e "Copying script to /bin/reconX"
cd /root/reconX
cp /root/reconX/reconX.sh /bin/reconX
clear
while true
do  
	clear
	echo -e "Are you \e[1;33mu\e[0mpdating or \e[1;33mi\e[0mnstalling the script?(\e[1;33mu\e[0m/\e[1;33mi\e[0m): "
	echo -e "Only use 'i' for the first time."
	read UORI
	if [[ "$UORI" = "u" ]]
	then 
		clear 
		echo -e "This feature is currently under construction.."
		sleep 3
	elif [[ "$UORI" = "i" ]]
	then 
		clear
		BASHCHECK=$(cat ~/.bashrc | grep "/bin/reconX")
		if [[ "$BASHCHECK" != "" ]]
		then 
			echo -e "I SAID USE i ONLY ONE TIME..........."
			sleep 3
			break
		fi
		echo -e "Adding Recon-X to PATH so you can access it from anywhere"
		sleep 1
		export PATH=/bin/reconX:$PATH
		sleep 1
		echo "export PATH=/bin/reconX:$PATH" >> ~/.bashrc
		sleep 1
		clear
		break
	fi
done
clear
echo -e "${White}Installing Dependencies.."
sleep 0.1
echo -e "${White}Installing Curl"
sudo apt install curl
clear
sleep 1
echo -e "Installation is finished. Type 'reconX' to launch the script after we exit."
sleep 0.5
echo -en "Starting reconX"; sleep 0.5 ;echo -en "." ;sleep 0.5 ;echo -en "." ;sleep 0.5 ;echo -en "." ;sleep 0.5 ;echo -en "." ;
sudo reconX


