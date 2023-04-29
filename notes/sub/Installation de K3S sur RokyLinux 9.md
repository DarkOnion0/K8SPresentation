**Types**:: #🌲, #⏳  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Configuration Options | K3s](https://docs.k3s.io/installation/configuration)
[HIGH AVAILABILITY k3s (Kubernetes) in minutes! - YouTube](https://www.youtube.com/watch?v=UoOcLXfa8EU&list=PL8cwSAAaP9W3uHIOFmZVQ2HBTXqob7T6P)
%%

# Prérequis

> [!warning]  
> Certaine modification ont déjà été faite en amont pour seulement se concentrer sur l'essentiel de la présentation
>
> 1. désactivation de SELinux
> 2. désactivation du firewall
> 3. installation du dépôt epel

1. Aller dans le dossier que je vous ai fait télécharger
2. Aller dans le répertoire VM
3. Exécuter la commande suivante `vagrant up`
4. Ouvrez 2 fenêtres en parallèle pour se connecter au 2 serveurs en direct
   1. `vagrant ssh kubemaster` -> master node
   2. `vagrant ssh kubeworker` -> worker node

# Installation De K3S

> [!todo]  
> Checker que tout fonctionne

## Master

```bash
# Install K3S with unsafe settings but that are easier to use
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" K3S_TOKEN=123456 sh -s -
```

## Worker

```bash
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent" K3S_URL=https://192.168.244.2:6443 K3S_TOKEN=123456 sh -s -
```

# Post-install

## Récupérer Les Accès

> [!info]  
> A éxécuter sur le master node

```bash
sudo cat /etc/rancher/k3s/k3s.yaml
```

---

Copier les accès et les mettre dans le fichier `k3s.yaml`

---

Modifier l'ip du server `127.0.0.1` -> `192.168.244.2`

---

Vérifier que la config fonctionne

```bash
kubectl get nodes
```

On devrait voir 2 serveurs

**🎉 Vous venez d'avoir votre 1re interaction avec le cluster 🎉**
