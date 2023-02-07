docker build -t front:2 . &&
	minikube image load front:2 &&
	kubectl apply -f kubernetes/front-deployment.yaml &&
	kubectl apply -f kubernetes/front-service.yaml &&
	kubectl apply -f kubernetes/front-autoscale.yaml
