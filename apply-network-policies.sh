kubectl apply -f default-network-policy.yaml
kubectl apply -f front/kubernetes/front-network-policy.yaml
kubectl apply -f api/kubernetes/api-network-policy.yaml
kubectl apply -f db/db-network-policy.yaml
