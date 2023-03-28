#Nginx Installation
#!/bin/bash

sudo apt install nginx -y
sudo cp grafana.my-coolpay.com.conf /etc/nginx/sites-enabled/
sudo cp prometeus.my-coolpay.com.conf /etc/nginx/sites-enabled/
sudo cp alertmanager.my-coolpay.com.conf /etc/nginx/sites-enabled/

sudo apt-get install apache2-utils
cd /etc/prometheus
sudo htpasswd -c .credentials admin 


sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx