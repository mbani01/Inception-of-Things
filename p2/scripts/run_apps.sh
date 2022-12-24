sudo kubectl apply -f /vagrant/confs/app1.yaml > /dev/null
sudo kubectl wait deployment -n default app1-deployment --for condition=Available=True --timeout=200s > /dev/null  
echo "app-one deployed successfully"
sudo kubectl apply -f /vagrant/confs/app2.yaml > /dev/null
sudo kubectl wait deployment -n default app2-deployment --for condition=Available=True --timeout=200s > /dev/null 
echo "app-two deployed successfully"
sudo kubectl apply -f /vagrant/confs/app3.yaml > /dev/null
sudo kubectl wait deployment -n default app3-deployment --for condition=Available=True --timeout=200s > /dev/null
echo "app-three deployed successfully"
sudo kubectl apply -f /vagrant/confs/ingress.yaml > /dev/null
while [ -z $external_ip ]; do echo "Waiting ingress...";
external_ip=$(sudo kubectl get ing ft-ingress --output="jsonpath={.status.loadBalancer.ingress[0].ip}"); 
[ -z "$external_ip" ] && sleep 10;
done; 
echo "Cluster ready to use: \033[0;31mhttp://$external_ip\033[0m"