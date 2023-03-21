server {
    listen 80;
    listen [::]:80;
    server_name  alertmanager.my-coolpay.com;

    location / {
        proxy_pass           http://localhost:9093/;
    }
}