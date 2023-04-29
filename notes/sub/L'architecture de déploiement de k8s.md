---
share: true
---

**Types**:: #🌲, #👶  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
MORE -> HP
[Using Minikube to Create a Cluster | Kubernetes](https://kubernetes.io/docs/tutorials/kubernetes-basics/create-cluster/cluster-intro/)
[Kubernetes: Up and Running, 3rd Edition [Book]](https://www.oreilly.com/library/view/kubernetes-up-and/9781098110192/)
%%

K8S a été pensé pour être scalable / fiable -> haute disponibilité (pas de temps d'arrêt dans les maintenances…)  
=> Plusieurs serveurs impliqués

# Concept

## Serveur

![module_01_cluster.svg](https://d33wubrfki0l68.cloudfront.net/283cc20bb49089cb2ca54d51b4ac27720c1a7902/34424/docs/tutorials/kubernetes-basics/public/images/module_01_cluster.svg)

> [!note]  
> On reviendra sur les nodes dans la section dédiée dans 4 parties \#[[Nodes]]

Kubernetes est une application qui fonctionne en cluster, c'est-à-dire avec des groupes de serveurs. Ils existent ainsi 2 types de serveurs majeurs dans K8S

1. Master [[Nodes]] -> le cerveau
2. Worker [[Nodes]] -> les membres

## Organisation Interne

```d2
Cluster Kubernetes: {
  ns1: kube-system {
    grid-rows: 2

	services
    pods1
    pods2
  }
  ns2: default {
	grid-rows: 2

    services
    pods1
    pods2
  }
  ns3: test {
    grid-rows: 2

    services
    pods1
    pods2
  }
  ns4: prod {
    grid-rows: 2

    services
    pods1
    pods2
  }
}
```

A l'image de dossiers différents dans un système traditionel pour différents types d'applications, taches… k8s possède des namespaces. Ceux sont des sortes de partitions de K8S qui contiennent un ensemble d'objets (déployments, IngressRoute, CRDs…)

```bash
kubectl --namespace $NAME [...] # Version longue + reste de la commande
kubectl -n $NAME [...] # Version courte + reste de la commande
```

Pour changer de namespace de façons plus durable, on peut utiliser les contextes Kubernetes. C'est en quelque sorte le fichier de configuration de `kubectl`. On peut le retrouver dans le fichier `$HOME/.kube/config` la plupart du temps.  
Il contient notamment les accès que nous allons copier pour nous connecter au serveur dans [[Installation de K3S sur RokyLinux 9]]  
=> pas en parle, car pas vraiment besoins pour une utilisation basique.

# Architecture

## Setup Minimal Recommandé

```d2
direction: right

m1: Master-01
w1: Worker-01

m1 <-> w1
```

## Setup Minimal++

```d2
srv: Serveur {
	w1: Master Parts
	m1: Worker Parts

	w1 <-> m1
}
```

## Setup Recommendé (perso)

```d2
direction: right

m1: Master-01
m2: Master-02

w1: Worker-01
w2: Worker-02

m1 <-> w1
m1 <-> w2

m2 <-> w1
m2 <-> w2
```

## Setup Recommandé `haute disponibilité`

```d2
direction: right
cluster: Kubernetes Cluster {
  master: Master Nodes {
    grid-rows: 3

    m1: Master-01
    m2: Master-02
    m3: Master-03
  }

  worker: Worker Nodes {
    grid-rows: 3

    w1: Worker-01
    w2: Worker-02
    w3: Worker-03
  }

  master <-> worker
}
```
