minikube delete --all

minikube start --cni calico

cd front
echo 'docker build -t front:2 . && minikube image load front:2'
docker build -t front:2 . && minikube image load front:2
echo ''

cd ../tls
echo 'Setting up tls encryption requirements'
echo 'kubectl create secret tls tls-certificate --key domain.key --cert domain.crt'
kubectl create secret tls tls-certificate --key domain.key --cert domain.crt
minikube addons configure ingress <<EOF
default/tls-certificate
y
EOF
minikube addons disable ingress
minikube addons enable ingress
echo ''

cd ../api
echo 'docker build -t api:2 . && minikube image load api:2'
docker build -t api:2 . && minikube image load api:2
echo ''

cd ../helm
echo 'helm lint'
helm lint
echo 'helm install containerization .'
helm install containerization .
echo ''

echo 'kubectl get deployments'
kubectl get deployments
echo ''

echo 'kubectl get pods'
kubectl get pods
echo ''

echo 'Sleep for 4 seconds'
sleep 4

echo 'kubectl get deployments'
kubectl get deployments
echo ''

echo 'kubectl get pods -A'
kubectl get pods -A
echo ''

echo 'Some more time may be needed for the pods to start up'
echo ''
