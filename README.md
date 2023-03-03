# Containerization

## TLDR How to run

To deploy on minikube using helm follow the steps in `start-minikube-and-deploy.sh` or just run the script from the root folder of the project.
```zsh
chmod +x start-minikube-and-deploy.sh
./start-minikube-and-deploy.sh
```

This script will
- Delete existing minkube cluster if present
- Start a new minikube cluster with calico container network interface
- Build the docker images and load into minikube cluster registry
- Enable and configure ingress addon for TLS
- Lint and install helm charts
- 

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

## OpenSSL

Generate **private key**, **certificate signing request** and **self-signed certificate**.

```zsh
openssl req -newkey rsa:2048 -nodes -keyout domain.key -out domain.csr
openssl x509 -signkey domain.key -in domain.csr -req -days 365 -out domain.crt
```

Create secret
```zsh
kubectl create secret tls tls-certificate --key domain.key --cert domain.crt
```
