#Nginx Installation

sudo apt install nginx
sudo service nginx status

sudo cp grafana.my-coolpay.com.conf /etc/nginx/sites-enabled/

sudo service nginx restart
sudo service nginx status