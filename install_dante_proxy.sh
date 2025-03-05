#!/bin/bash

# Set terminal type
export TERM=xterm-256color

# Variables
SOCK_PORT=8888

# Download and install dante-server
echo "Downloading and installing dante-server"
curl -O https://www.inet.no/dante/files/dante-1.4.4.tar.gz
tar xvzf dante-1.4.4.tar.gz
cd dante-1.4.4
./configure
make && make install

# Create dante configuration file
echo "Setting up dante-server"
cat <<EOF | tee /etc/sockd.conf
logoutput: /var/log/sockd.log
internal: 0.0.0.0 port = ${SOCK_PORT}
external: eth0
clientmethod: none
socksmethod: none
user.privileged: root
user.notprivileged: nobody
client pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    log: error connect disconnect
}
socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    log: error connect disconnect
}
EOF

# Start sockd
# sudo /usr/local/sbin/sockd -D
cd ../
cp -f dante.service /lib/systemd/system/
chmod 644 /usr/lib/systemd/system/dante.service
systemctl daemon-reload 
