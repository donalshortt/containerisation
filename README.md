#containerisation

N.B: 
* before running deploy.all.sh, make sure to have minikube running with `minikube start --cni calico`
* the front will not be accessible from the nodePort IP, make sure to use the IP that minikube provides:
```zsh
minikube ip
```

