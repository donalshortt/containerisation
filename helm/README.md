1. `cd` to containerization/helm
2. Lint the helm chart `helm lint`
3. Install helm chart (on empty cluster!) `helm install containerization .`
4. Upgrade deployment with `helm upgrade containerization .`
5. Uninstall chart with `helm uninstall containerization`
6. Rollback to previous version with `helm rollback containerization <optional revision num>`