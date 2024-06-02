# COMMANDO TO ACCESS
sudo visudo

# To the end of the visudo
marodriguezd ALL=(ALL) NOPASSWD: /usr/bin/apt update, /usr/bin/apt upgrade, /usr/bin/apt autoremove
marodriguezd ALL=(ALL) NOPASSWD: /usr/bin/apt update -y, /usr/bin/apt upgrade -y, /usr/bin/apt autoremove -y
