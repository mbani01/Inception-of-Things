server_ip=$1

export INSTALL_K3S_EXEC="--bind-address=$server_ip --flannel-iface=eth1"
curl -sfL https://get.k3s.io | sh - && echo "K3s Server is Running ....................>_<"
sudo cp /var/lib/rancher/k3s/server/node-token /vagrant_data/server_token
sudo cp /etc/rancher/k3s/k3s.yaml /vagrant_data/config