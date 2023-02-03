sudo mkdir -p /opt/postgre/data

kubectl apply -f postgres-deployment.yaml
kubectl apply -f postgres-service.yaml
kubectl apply -f postgres-storage.yaml
kubectl apply -f postgres-config.yaml
kubectl apply -f postgres-secret.yaml
