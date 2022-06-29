upstream mynode {
        server localhost1;
        server localhost2;
}
server {
        listen 80;
        listen [::]:80;
        server_name test-upstream.com www.test-upstream.com;

        location / {
            proxy_pass http://mynode;
        }
}