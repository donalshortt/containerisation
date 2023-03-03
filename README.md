# Containerization

## TLDR How to run

To deploy on minikube using helm follow the steps in `start-minikube-and-deploy.sh` or just run the script from the root folder of the project.
```zsh
chmod +x start-minikube-and-deploy.sh
./start-minikube-and-deploy.sh
```

## Test using curl

To test https connection
```zsh
curl https://$(minikube ip) -k
curl https://$(minikube ip)/api/number -k
```
`https://` enforces TLS port **443** and `-k` ignores self-signed issue

## Helm

1. `cd` to containerization/helm
2. Lint the helm chart `helm lint`
3. Make sure docker images for api/ and front/ are built.
4. Push docker images for api and front again to minikube (see deploy.sh).
5. Install helm chart (on empty cluster!) `helm install containerization .`
6. Upgrade deployment with `helm upgrade containerization .`
7. Rollback to previous version with `helm rollback containerization <optional revision num>`
8. Uninstall chart with `helm uninstall containerization`

