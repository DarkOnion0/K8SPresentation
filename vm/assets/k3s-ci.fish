vagrant ssh kubmaster --command "fish /vagrant/vm/assets/install-k3s.fish -t master"
printf "\n=================================================================\n"
vagrant ssh kubworker --command "fish /vagrant/vm/assets/install-k3s.fish -t worker"
