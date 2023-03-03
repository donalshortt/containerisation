# Containerization

## TLDR how to run

To deploy on minikube using helm follow the steps in `start-minikube-and-deploy.sh` or just run the script from the root folder of the project.
```zsh
chmod +x start-minikube-and-deploy.sh
./start-minikube-and-deploy.sh
```

To test https connection
```zsh
curl https://$(minikube ip) -k
curl https://$(minikube ip)/api/number -k
```
`https://` enforces TLS port **443** and `-k` ignores self-signed issue

## Presentation - Prerequisites

- Have minikube running

- For network policies to take effect we need **Container network interface: calico** 

  ```zsh
  minikube start --cni calico
  ```

- The front will not be accessible from the nodePort IP, make sure to use the IP that minikube provides:
    ```zsh
    minikube ip
    ```

- Default minikube storageclass

- Generate certificates self-signed using openSSL 

  - Generate **private key** and **certificate signing request** using **openssl**
  - Create the **self signed certificate**

  ```zsh
  openssl req -newkey rsa:2048 -nodes -keyout domain.key -out domain.csr
  openssl x509 -signkey domain.key -in domain.csr -req -days 365 -out domain.crt
  kubectl create secret tls tls-certificate --key domain.key --cert domain.crt
  ```

- Ingress for tls

  ```
  minikube addons configure ingress
    default/tls-certificate
  minikube addons disable ingress
  minikube addons enable ingress
  kubectl apply -f ingress.yaml
  ```

- Roles are appied applied by helm

- Network policies applied by helm

## Container build

```zsh
cd /front
docker build -t front:2 . &&
	minikube image load front:2
```

```zsh
cd /api
docker build -t api:2 . &&
	minikube image load api:2
```

