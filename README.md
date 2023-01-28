# Inception-of-Things
## [Part 1: Setting up a K3s cluster with Vagrant](https://github.com/mbani01/Inception-of-Things/tree/main/p1)

This project guides you through the process of setting up a Kubernetes cluster using K3s and Vagrant. 

### Prerequisites
- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)

### Step 1: Create the VMs
- Clone the repository
- Run `vagrant up` in the project directory to create the VMs. This will create two VMs named "mbaniS" and "mbaniSW" with dedicated IPs on the eth1 interface. The IP of the first machine (Server) will be 192.168.56.110, and the IP of the second machine (ServerWorker) will be 192.168.56.111.

### Step 2: Access the cluster
- SSH into the "mbaniS" VM using `vagrant ssh mbaniS`
- Use `kubectl` commands to interact with the cluster.
