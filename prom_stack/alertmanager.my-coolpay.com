server {
    listen 80;
    listen [::]:80;
    server_name  alertmanager.my-coolpay.com;

    location / {
        proxy_pass   http://localhost:9093/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}