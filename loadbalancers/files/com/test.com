server {
        listen 80;
        listen [::]:80;

        root /var/www/test.com/html;
        index index.html index.htm index.nginx-debian.html;

        server_name test.com www.test.com;

        error_page 404 /404.html;
        error_page 401 /401.html;

        location /admin.html {
            auth_basic "Restricted Content";
            auth_basic_user_file /etc/nginx/.htpasswd;
        }
}
