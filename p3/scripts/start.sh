SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
# Create a k3d cluster
k3d cluster create iot --api-port=6443 -p "8888:30080@agent:0" --agents 2
#create dev namespace
sudo kubectl create namespace dev
# argocd Configuration
sudo kubectl create namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
#wait for all pods to be ready
echo "Running argocd ....."
sudo kubectl wait -n argocd --for=condition=Ready pods --all --timeout=-1s
#set password for argocd
sudo kubectl -n argocd patch secret argocd-secret -p '{"stringData": { "admin.password": "$2a$12$ZnwZ4pO6HAAvANnzrZa2D.N6cOUvionEdjiL5lwgYXuuoqMW4aG/W", "admin.passwordMtime": "'$(date +%FT%T%Z)'" }}'
# Create the app in argocd
sudo kubectl apply -f $SCRIPTPATH/../confs/argocd.yaml
while [ "$POD_STATE" != "Running" ]; do echo "Waiting for app to be created";
POD_STATE=$(sudo kubectl get po -n dev  --output="jsonpath={.items..phase}") && sleep 10;
done;
#make argocd ui accessible from localhost:8080
while true; do sudo kubectl port-forward svc/argocd-server -n argocd 8080:443; done > /dev/null 2>&1 &
echo "Cluster ready to use: http://localhost:8888"
