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

rm -rf prometheus-2.41.0.linux-amd64.tar.gz prometheus-2.41.0.linux-amd64

sudo cp prometheus.yml /etc/prometheus/
sudo cp web-config.yml /etc/prometheus/
sudo cp prometheus.service /etc/systemd/system/prometheus.service

promtool check web-config /etc/prometheus/web-config.yml

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

#Black box exporter 0.23.0 Installation

sudo useradd --no-create-home --shell /bin/false blackbox_exporter
wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.23.0/blackbox_exporter-0.23.0.linux-amd64.tar.gz
tar xvfz blackbox_exporter-0.23.0.linux-amd64.tar.gz
sudo mv blackbox_exporter-0.23.0.linux-amd64/blackbox_exporter /usr/local/bin

rm -rf blackbox_exporter-0.23.0.linux-amd64.tar.gz blackbox_exporter-0.23.0.linux-amd64

sudo mkdir /etc/blackbox_exporter
sudo cp blackbox.yml  /etc/blackbox_exporter/
sudo cp blackbox_exporter.service /etc/systemd/system/blackbox_exporter.service

sudo chown blackbox_exporter:blackbox_exporter /usr/local/bin/blackbox_exporter
sudo chown -R blackbox_exporter:blackbox_exporter /etc/blackbox_exporter/


#RDS_exporter 0.7.2 installation

sudo useradd --no-create-home rds-exporter
sudo mkdir /etc/rds-exporter

wget https://github.com/percona/rds_exporter/releases/download/v0.7.2/rds_exporter-0.7.2.linux-amd64.tar.gz
tar xzf rds_exporter-0.7.2.linux-amd64.tar.gz
sudo cp rds_exporter-0.7.2.linux-amd64/rds_exporter /usr/local/bin/rds-exporter
rm -rf rds_exporter-0.7.2.linux-amd64.tar.gz rds_exporter-0.7.2.linux-amd64

sudo cp rds_exporter_config.yml /etc/rds-exporter/
sudo cp rds-exporter.service /etc/systemd/system/rds-exporter.service

#Grafana 9.3.6 Installation

sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_9.3.6_amd64.deb
sudo dpkg -i grafana_9.3.6_amd64.deb
rm grafana_9.3.6_amd64.deb

#AlertManager 0.24.0 Installation

wget https://github.com/prometheus/alertmanager/releases/download/v0.24.0/alertmanager-0.24.0.linux-amd64.tar.gz
tar xvfz alertmanager-0.24.0.linux-amd64.tar.gz

sudo cp alertmanager-0.24.0.linux-amd64/alertmanager /usr/local/bin
sudo cp alertmanager-0.24.0.linux-amd64/amtool /usr/local/bin/
sudo mkdir /var/lib/alertmanager

rm -rf alertmanager-0.24.0.linux-amd64.tar.gz alertmanager-0.24.0.linux-amd64

sudo cp alertmanager.yml /etc/prometheus/
sudo cp alertmanager.service /etc/systemd/system/alertmanager.service


sudo chown -R prometheus:prometheus /etc/prometheus

# Démarrer les services
sudo systemctl daemon-reload
sudo systemctl enable prometheus grafana-server alertmanager node-exporter rds-exporter blackbox_exporter
sudo systemctl start prometheus grafana-server alertmanager node-exporter rds-exporter blackbox_exporter