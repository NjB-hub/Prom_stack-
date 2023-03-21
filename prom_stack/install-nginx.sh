#Nginx Installation

sudo apt install nginx

sudo cp grafana.my-coolpay.com.conf /etc/nginx/sites-enabled/

sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx