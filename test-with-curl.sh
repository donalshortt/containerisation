echo 'curl http://$(minikube ip)'
curl http://$(minikube ip)
echo ''

echo 'curl https://$(minikube ip) -k'
curl https://$(minikube ip) -k
echo ''

echo 'curl https://$(minikube ip)/api/number -k'
curl https://$(minikube ip)/api/number -k
echo ''
echo ''

echo 'curl https://$(minikube ip)/api/number -k -X POST'
curl https://$(minikube ip)/api/number -k -X POST
echo ''
echo ''

echo 'curl https://$(minikube ip)/api/number -k'
curl https://$(minikube ip)/api/number -k
echo ''
echo ''
