
server_ip = "192.168.56.110"

agent_ip = "192.168.56.111"

Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "hashicorp/bionic64"

  # Disable the default synced_folder to avoid getting log files from guest machine
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./shared", "/vagrant_data", disabled: false


  # Server machine configuration
  config.vm.define "mbaniS" do |control|
    control.vm.hostname = "mbaniS"
    control.vm.network "private_network", ip: server_ip
    control.vm.network "forwarded_port", guest: 6443, host: 6643
      control.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--name", "mbaniS"]
        v.memory = '1024'
        v.cpus = 1
      end 
    control.vm.provision "shell", path: "k3s_server.sh", args: [server_ip]
  end

  # Agent machine configuration
  config.vm.define "mbaniSW" do |control|
    control.vm.hostname = "mbaniSW"
    control.vm.network "private_network", ip: agent_ip
    control.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "mbaniSW"]
      v.memory = '521'
      v.cpus = 1
    end
    control.vm.provision "shell", path: "k3s_worker.sh", args: [server_ip]
  end

end
