# Create a k3d cluster
k3d cluster create iot --api-port 6443 -p 8080:80@loadbalancer --agents 2
# argocd Configuration
# sudo kubectl create namespace argocd
# sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml