To deploy the deployment:
```zsh
kubectl apply -f front-deployment.yaml
```

To deploy the service:
```zsh
kubectl apply -f front-service.yaml
```

Note for minikube:
To connect via the browser, do not use the ip of the service, use the one found with:

```zsh
minikube ip
```
