{pkgs, ...}: {
  env = {
    KUBECONFIG = "./k3s.yaml";
  };

  hosts = {
    "kubemaster.local" = "192.168.56.101";
    "kubeworker.local" = "192.168.56.102";
  };

  packages = with pkgs; [
    # K8S toolings
    kubectl
    lens
    kubernetes-helm

    # VM
    vagrant
    packer
  ];
}
