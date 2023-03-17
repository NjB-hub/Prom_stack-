#AlertManager 0.24.0 Installation
#!/bin/bash

wget https://github.com/prometheus/alertmanager/releases/download/v0.24.0/alertmanager-0.24.0.linux-amd64.tar.gz
tar xvfz alertmanager-0.24.0.linux-amd64.tar.gz

sudo cp alertmanager-0.24.0.linux-amd64/alertmanager /usr/local/bin
sudo cp alertmanager-0.24.0.linux-amd64/amtool /usr/local/bin/
sudo mkdir /var/lib/alertmanager

rm -rf alertmanager-0.24.0.linux-amd64.tar.gz alertmanager-0.24.0.linux-amd64

sudo cp alertmanager.yml /etc/prometheus/
sudo cp rules.yml /etc/prometheus/
sudo cp alertmanager.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable alertmanager
sudo systemctl start alertmanager

sudo chown -R prometheus:prometheus /etc/prometheus
sudo systemctl restart prometheus