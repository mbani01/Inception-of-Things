# Inception-of-Things
This project covers setting up a virtual environment for Kubernetes deployment using Vagrant, deploying K3s and understanding its Ingress feature, learning how to simplify Kubernetes management with K3d, and implementing CI for working clusters in Docker. Perfect for developers looking to gain hands-on experience with Kubernetes and improve their CI skills.

### Prerequisites
- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)

## [Part 1: Setting up a K3s cluster with Vagrant](https://github.com/mbani01/Inception-of-Things/tree/main/p1)

### Step 1: Create the VMs
- Clone the repository
- Run `vagrant up` in the project directory to create the VMs. This will create two VMs named "mbaniS" and "mbaniSW" with dedicated IPs on the eth1 interface. The IP of the first machine (Server) will be 192.168.56.110, and the IP of the second machine (ServerWorker) will be 192.168.56.111.

### Step 2: Access the cluster
- SSH into the "mbaniS" VM using `vagrant ssh mbaniS`
- Use `kubectl` commands to interact with the cluster.

# [Part 2: K3s and Three Simple Applications](https://github.com/mbani01/Inception-of-Things/tree/main/p2)

In this part of the project, we will be running three simple web applications within a K3s instance on a single virtual machine.
The virtual machine will have the latest stable version of K3s installed in server mode. 

You will be able to access these applications depending on the HOST used when making a request to the IP address 192.168.56.110. 
Here is a small example diagram:

<p align="center">
  <img src="https://github.com/mbani01/Inception-of-Things/blob/main/assests/K3s_and_three_simple_applications.png" alt="K3s_and_three_simple_applications">
</p>

When a client inputs the IP 192.168.56.110 in his web browser with the HOST app1.com,
the server must display the app1. When the HOST app2.com is used, the server must display the app2. Otherwise, the app3 will be selected by default.
