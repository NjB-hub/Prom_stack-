#RDS exporter 0.7.2 Installation
#!/bin/bash

sudo useradd --no-create-home rds-exporter
sudo mkdir /etc/rds-exporter
sudo mkdir /var/lib/rds-exporter

wget https://github.com/percona/rds_exporter/releases/download/v0.7.2/rds_exporter-0.7.2.linux-amd64.tar.gz
tar xzf rds_exporter-0.7.2.linux-amd64.tar.gz
sudo cp rds_exporter-0.7.2.linux-amd64/rds_exporter /usr/local/bin/rds_exporter
rm -rf rds_exporter-0.7.2.linux-amd64.tar.gz rds_exporter-0.7.2.linux-amd64

sudo cp rds_exporter_config.yml /etc/rds-exporter/
sudo cp rds-exporter.service /etc/systemd/system/rds-exporter.service

sudo systemctl daemon-reload
sudo systemctl enable rds-exporter
sudo systemctl start rds-exporter
sudo systemctl status rds-exporter