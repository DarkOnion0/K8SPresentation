#!/usr/bin/env fish
# ========
# | ENVs |
# ========

set --local PASSWORD "123456"
set --local SRV_IP "192.168.244.2"

# ========
# | APPs |
# ========

# Define the available CMD flag
set --local options 'h/help' 't/type='

# Parse the CMD flag
argparse $options -- $argv

# Take action according to the provdided CMD flags

if set --query _flag_help
  printf "Usage: [OPTIONS]\n\n"
  printf "Options:\n"
  printf "  -h/--help       Prints help and exits\n"
  printf "  -t/--type       Define the install type, master/worker\n"
  exit
end


if set --query _flag_type
    printf "Install type: %s\n" $_flag_type

    if string match -q "master" $_flag_type # Launch the master install script
        curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" K3S_TOKEN=$PASSWORD sh -s -
        printf "\n\nKubeconfig file :"
        printf "\n=================\n"
        sudo cat /etc/rancher/k3s/k3s.yaml | sed "s|127.0.0.1|$SRV_IP|g"
    else if string match -q "worker" $_flag_type # Launch the worker install script
        curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent" K3S_URL=https://$SRV_IP:6443 K3S_TOKEN=$PASSWORD sh -s -
    else # Crash if the value passed is not worker or master
        printf "%s is not a correct value for --type\n" $_flag_type
        exit
    end
else # Crash if no type is passed
    printf "You havn't specified an install method!\n"
    exit
end

