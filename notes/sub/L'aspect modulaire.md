---
share: true
---

**Types**:: #🌲, #⏳  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Composants de Kubernetes | Kubernetes](https://kubernetes.io/fr/docs/concepts/overview/components/)
[Kubernetes Components | Kubernetes](https://kubernetes.io/docs/concepts/overview/components/)
[Kubernetes: Up and Running, 3rd Edition [Book]](https://www.oreilly.com/library/view/kubernetes-up-and/9781098110192/)
%%

Kubernetes est comme une gigantesque boite de Lego et est ainsi composé de plusieurs parties qui s'imbriquent et travaillent entre elles pour donner une structure cohérente.  
Cela peut être un peu intimidant au 1er abord, mais c'est en réalité un réel point fort pour des utilisations éclairé. Cela permettant d'adapter le fonctionnement de votre cluster Kubernetes à vos besoins tout en gardant les avantages d'une API uniformisée.

On peut ainsi découper les principaux composants de Kubernetes dans les parties suivantes.

> [!todo]  
> relégender avec master et worker nodes

![components-of-kubernetes.svg](https://d33wubrfki0l68.cloudfront.net/2475489eaf20163ec0f54ddc1d92aa8d4c87c96b/e7c81/images/docs/components-of-kubernetes.svg)

1. DB -> Gére les états des déploiements, IngressRoute… dans le cluster (ETCD, SQLite…)
2. Container Runtime -> L'environnement d'exécution de conteneurs est le logiciel responsable de l'exécution des conteneurs (CRI-O, Containerd…)
3. Cluster Ingress -> Gère l'accsès au application dans le cluster, les rediréctions, le load-balancing… (NGINX, Traefik…)
4. kubelet -> Vérifie que les conteneurs tournent bien sur le node
5. kube-proxy -> permet l'accès aux applications du pod  
   Il route le trafic réseau et joue le rôle de _load-balancer_ => présent sur tous les nodes \#[[DaemonSets]]

…
