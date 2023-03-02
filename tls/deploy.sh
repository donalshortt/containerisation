kubectl create secret tls tls-certificate --key domain.key --cert domain.crt

echo "In the custom cert prompt enter: 'default/tls-certificate'"
minikube addons configure ingress
minikube addons disable ingress
minikube addons enable ingress

kubectl apply -f ingress.yaml

# https enforces TLS port 443 and -k ignores self-signed issue
# curl https://$(minikube ip) -k
# curl https://$(minikube ip)/api/number -k
