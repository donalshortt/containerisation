kubectl create secret tls tls-certificate --key domain.key --cert domain.crt

minikube addons configure ingress <<EOF
default/tls-certificate
y
EOF

minikube addons disable ingress
minikube addons enable ingress
