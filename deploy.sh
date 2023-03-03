minikube delete

minikube start --cni calico

cd front
echo 'docker build -t front:2 . &&'
echo '	minikube image load front:2'
docker build -t front:2 . &&
	minikube image load front:2
echo ''

cd ../tls
echo 'Setting up tls encryption requirements'
./setup.sh
echo ''

cd ../api
echo 'docker build -t api:2 . &&'
echo '	minikube image load api:2'
docker build -t api:2 . &&
	minikube image load api:2
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

sleep 4

echo 'kubectl get deployments'
kubectl get deployments
echo ''

echo 'kubectl get pods'
kubectl get pods
echo ''

echo 'curl https://$(minikube ip) -k'
curl https://$(minikube ip) -k
echo ''
