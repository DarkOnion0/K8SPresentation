---
share: true
---

**Types**:: #🌲  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Nodes | Kubernetes](https://kubernetes.io/docs/concepts/architecture/nodes/)
%%

# Introduction

> [!warning]  
> Worker node ne se dit plus, le terme est jugé offensant \#[What is the difference between kubernetes labels node-role.kubernetes.io/master and node-role.kubernetes.io/control-plane? - Stack Overflow](https://stackoverflow.com/questions/66186014/what-is-the-difference-between-kubernetes-labels-node-role-kubernetes-io-master)

Un node est l'équivalent d'un serveur (physique ou virtuel) faisant tourner kubernetes, il en existe 2 catégories

1. Le contrôle plane / master node -> le serveur qui va être responsable de l'orchestration du cluster (contient les états, gère le cluster…)
2. Le worker node -> le serveur qui exécute toutes les taches du master node

> [!tip]  
> Pour communiquer avec le cluster, on parle au master node qui renvoie au worker, jamais l'inverse

# Détail Des Propriétés

On peut y accéder comme nous l'avons fait précédemment avec la commande

```bash
kubectl get nodes -o wide
```
