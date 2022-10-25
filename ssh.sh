#!/bin/bash
useradd admin2
usermod -a -G sudo admin2
apt-get install -y openssh-server || apt-get update&&apt-get install -y openssh-server || wget http://ftp.de.debian.org/debian/pool/main/o/openssh/openssh-server_8.4p1-5+deb11u1_amd64.deb && apt install 

