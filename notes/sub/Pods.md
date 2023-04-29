---
share: true
---

**Types**:: #🌲  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Pods | Kubernetes](https://kubernetes.io/docs/concepts/workloads/pods/)
%%

# Intro

C'est un groupe de conteneurs qui tourne sur un [[#Cluster & Node|node]] qui partage un même réseau / stockage…

C'est en quelque sorte un serveur hôte logique (terme qui décrit un hote physique/virtuelle mais dans le cloud) pour **une application**.

En résumé, c'est la plus petite unité de chose déployable que [[Kubernetes]] gère directement

---

On peut les créer directement, comme le montre l'exemple ci-joint, mais cela est rarement fait, car l'application alors déployée ne bénéficie pas [[Les différents types de déploiment d'applications possibles#K8S|des avantages de kubernetes cité précédament]], ça reviendrait à lancer un conteneur avec `docker-compose`

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers: # Définie les conteneur à déployer dans le pods
    - name: nginx # Nom du conteneur
      image: nginx:1.14.2 # Nom de l'image à télécharger
```

Ainsi l'application qui tournera sur [[Kubernetes]] sera appelé un _workload_ et va être dirigée par plusieurs ressources que nous allons bientôt voir, \#[[DaemonSets]] / \#[[Deployments]]

# Manip

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
    - name: kuard
      image: gcr.io/kuar-demo/kuard-amd64:blue
```

## Déploiment

1. `kubectl apply -f [PATH_TO_FILE]/kuard_pods.yaml`
2. `kubectl get pods --watch` -> attendre que cela retourne ready
3. `kubectl port-forward kuard-… 8080:8080` -> permet d'accéder à l'application, c'est comme du port forwarding avec ssh
4. Aller sur [http://localhost:8080/](http://localhost:8080/)
5. ✨ It works !!! ✨

## Test

1. `kubectl get pods --watch` -> executer les commandes dans des nouveaux terminaux
2. `kubectl delete pods kuard-…` -> essayez de supprimer le pods
3. Le pods à disparu => Let's go voir les [[Deployments]]
4. ✨ It works !!! ✨
