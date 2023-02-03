docker build -t api:2 . &&
	kubectl apply -f kubernetes/api-deployment.yaml &&
	kubectl apply -f kubernetes/api-service.yaml
