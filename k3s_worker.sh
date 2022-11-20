server_ip=$1

k3s_token_file="/vagrant_data/server_token"
server_url="https://${server_ip}:6443"
sudo touch /etc/profile.d/vars.sh
echo "export K3S_TOKEN_FILE=${k3s_token_file}" >> /etc/profile.d/vars.sh
echo "export K3S_URL=${server_url}" >> /etc/profile.d/vars.sh
echo "sudo mkdir -p $HOME/.kube" >> /etc/profile.d/vars.sh
echo "sudo cp /vagrant_data/config $HOME/.kube/" >> /etc/profile.d/vars.sh
curl -sfL https://get.k3s.io | K3S_URL=${server_url} K3S_TOKEN_FILE=${k3s_token_file}  INSTALL_K3S_EXEC="--flannel-iface=eth1" sh - && echo "K3s Agent is Running ....................>_<"