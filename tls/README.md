To test https connection

```zsh
curl https://$(minikube ip) -k
curl https://$(minikube ip)/api/number -k
```

`https://` enforces TLS port 443 and -k ignores self-signed issue
