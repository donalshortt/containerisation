openssl req -newkey rsa:2048 -nodes -keyout domain.key -out domain.csr
openssl x509 -signkey domain.key -in domain.csr -req -days 365 -out domain.crt
