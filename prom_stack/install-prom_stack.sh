#Prometheus_stack installation

#!/bin/bash


sudo useradd --no-create-home prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
 
wget  https://github.com/prometheus/prometheus/releases/download/v2.41.0/prometheus-2.41.0.linux-amd64.tar.gz
tar -xvf prometheus-2.41.0.linux-amd64.tar.gz
sudo cp prometheus-2.41.0.linux-amd64/prometheus /usr/local/bin
sudo cp prometheus-2.41.0.linux-amd64/promtool /usr/local/bin
sudo cp -r prometheus-2.41.0.linux-amd64/consoles /etc/prometheus/
sudo cp -r prometheus-2.41.0.linux-amd64/console_libraries /etc/prometheus
sudo cp prometheus-2.41.0.linux-amd64/promtool /usr/local/bin/

rm -rf prometheus-2.41.0.linux-amd64.tar.gz prometheus-2.19.0.linux-amd64

sudo cp prometheus.yml /etc/prometheus/
sudo cp prometheus.service /etc/systemd/system/prometheus.service

sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus


#Node_exporter 1.0.5 installation

sudo useradd --no-create-home node_exporter

wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar xzf node_exporter-1.5.0.linux-amd64.tar.gz
sudo cp node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin/node_exporter
rm -rf node_exporter-1.5.0.linux-amd64.tar.gz node_exporter-1.5.0.linux-amd64

sudo cp node-exporter.service /etc/systemd/system/node-exporter.service


#Grafana 9.3.6 Installation

sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_9.3.6_amd64.deb
sudo dpkg -i grafana_9.3.6_amd64.deb



# Démarrer les services
sudo systemctl daemon-reload
sudo systemctl enable prometheus grafana-server alertmanager node_exporter
sudo systemctl start prometheus grafana-server alertmanager node_exporter