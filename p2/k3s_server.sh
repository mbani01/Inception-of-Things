server_ip=$1

export INSTALL_K3S_EXEC="--bind-address=$server_ip --flannel-iface=eth1"
curl -sfL https://get.k3s.io | sh - && echo "K3s Server is Running ....................>_<"
echo "alias k=\"sudo kubectl\"" >> /etc/profile