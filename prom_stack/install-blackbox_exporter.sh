#Black box exporter 0.23.0 Installation
#!/bin/bash

wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.23.0/blackbox_exporter-0.23.0.linux-amd64.tar.gz
tar xvfz blackbox_exporter-0.23.0.linux-amd64.tar.gz
sudo mv blackbox_exporter-0.23.0.linux-amd64/blackbox_exporter /usr/local/bin
sudo useradd --no-create-home --shell /bin/false blackbox_exporter

rm -rf blackbox_exporter-0.23.0.linux-amd64.tar.gz blackbox_exporter-0.23.0.linux-amd64

sudo mkdir /etc/blackbox_exporter
sudo cp blackbox_exporter-0.23.0.linux-amd64/blackbox.yml  /etc/blackbox_exporter/
sudo cp blackbox_exporter.service /etc/systemd/system/blackbox_exporter.service


sudo chown blackbox_exporter:blackbox_exporter /usr/local/bin/blackbox_exporter
sudo chown -R blackbox_exporter:blackbox_exporter /etc/blackbox_exporter/

sudo systemctl daemon-reload
sudo systemctl enable blackbox_exporter
sudo systemctl start blackbox_exporter
sudo systemctl status blackbox_exporter

