#Nginx Installation
#!/bin/bash

sudo apt install nginx -y

sudo cp grafana.my-coolpay.com.conf /etc/nginx/sites-enabled/

sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx