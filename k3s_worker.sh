k3s_url="https://192.168.42.110:6443"
k3s_token=$(cat /vagrant/server_token)
curl -sfL https://get.k3s.io | K3S_URL=${k3s_url} K3S_TOKEN=${k3s_token} sh -