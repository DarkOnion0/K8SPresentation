{pkgs, ...}: {
  env = {
    KUBECONFIG = "./k3s.yaml";
  };

  hosts = {
    "kubemaster.local" = "192.168.244.2";
    "kubeworker.local" = "192.168.244.3";
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
