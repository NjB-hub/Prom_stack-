#Grafana 9.3.6 Installation
#!/bin/bash

sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_9.3.6_amd64.deb
sudo dpkg -i grafana_9.3.6_amd64.deb
rm grafana_9.3.6_amd64.deb

sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl enable grafana-server.service
sudo systemctl status grafana-server
