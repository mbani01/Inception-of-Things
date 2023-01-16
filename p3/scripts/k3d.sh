# Create a k3d cluster
k3d cluster create iot
# argocd Configuration
sudo kubectl create namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
#make argocd ui accessible from localhost:8080
sudo kubectl port-forward svc/argocd-server -n argocd 8080:443 > /dev/null 2>&1 &
#set password for argocd
sudo kubectl -n argocd patch secret argocd-secret -p '{"stringData": { "admin.password": "$2a$12$ZnwZ4pO6HAAvANnzrZa2D.N6cOUvionEdjiL5lwgYXuuoqMW4aG/W", "admin.passwordMtime": "'$(date +%FT%T%Z)'" }}'
argocd login $(sudo kubectl describe svc/argocd-server -n argocd | grep IP: | awk '{print $2;}') --username admin --password $(sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo) --insecure