#YACE exporter 0.7.2 Installation
#!/bin/bash

wget https://github.com/nerdswords/yet-another-cloudwatch-exporter/releases/download/v0.49.2/yet-another-cloudwatch-exporter_0.49.2_Linux_x86_64.tar.gz
tar -xvzf yet-another-cloudwatch-exporter_0.49.2_Linux_x86_64.tar.gz 
sudo cp yace /usr/local/bin/
sudo chmod +x /usr/local/bin/yace

sudo cp config.yml /usr/local/bin/

rm -rf yace yet-another-cloudwatch-exporter_0.49.2_Linux_x86_64.tar.gz  
cd /usr/local/bin/
./yace

sudo systemctl daemon-reload
