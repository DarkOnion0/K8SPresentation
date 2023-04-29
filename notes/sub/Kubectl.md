---
share: true
---

**Types**:: #🌲, #👶  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

# CRUD Ou _« Create, Read, Update, Delete »_

## Read

Permet de voir les objects K8S

```bash
kubectl get $OBJECT_CATEGORIE # Affiche les éléments dans un cluster k8s suivant le contexte utilisé
kubectl get $OBJECT_CATEGORIE $NAME # Affiche l'élément de la catégorie séléctionnée dans un cluster k8s suivant le contexte utilisé
```

> [!example]
>
> ```bash
> kubectl get deployments -n kube-system
> kubectl get deployments coredns -n kube-system
> ```

---

Permet d'obtenir des informations détaillées sur une ressource

```bash
kubectl describe $OBJECT_CATEGORIE $NAME # Affiche les informations détaillées d'un objet suivant le contexte utilisé
```

> [!example]
>
> ```bash
> kubectl describe deployments coredns -n kube-system
> ```

## Create / Update Objets

> [!warning]  
> J'omets volontairement le `kubectl create […]` car je pense que la ce n'est pas la philosophie de Kubernetes

La commande applique la différence d'état entre les fichiers et la configuration du cluster. Si le cluster ne possède pas une ressource elle sera créée, si elle existe et qu'elle est similaire elle sera ignorée sinon elle sera mise à jour

```bash
kubectl apply -f $FILES # Applique la configuration des fichiers spécifés au cluster suivant le contexte utilisé
```

> [!example]
>
> ```bash
> kubectl apply -f ./assets/kuard.yaml
> kubect get pods
> ```

## Delete

Cette commande reprend la même structure et fonctionnement que [[#Create / Update Objets]], mais pour supprimer des ressources.

```bash
kubectl delete -f $FILES # Supprime la configuration des fichiers spécifés au cluster suivant le contexte utilisé
```

> [!example]
>
> ```bash
> kubectl delete -f ./assets/kuard.yaml
> kubect get pods
> ```

# Debug

Comme pour toutes infrastructures, Kubernetes implémente aussi des commandes pour déboguer et [[K8S Admin Apps|monitorer ses applications]]

## Logs

La commande suivante permet d'avoir les logs du pod

```bash
 kubectl logs $POD_NAME # Affiche les logs
```

> [!example]
>
> ```bash
>  kubectl logs coredns-[...] # Affiche les logs de coredns
> ```

## Interagir Avec Le Conteneur

> [!todo]  
> Faire une phrase

Souvent pour voir comment le conteneur interagit avec ses congénères, voir les accès réseau… ou déboguer les modifications qui ne sont parfois pas appliquées au conteneur malgré un redéploiement à cause d'une mauvaise conception d'image.

```bash
kubectl exec -it $POD_NAME -- bash # Permet de se *connecter* au pod
```

> [!example]
>
> ```bash
> kubectl exec -it coredns-[...] -- bash # Permet de se *connecter* au pod coredns
> ```

## Le Port-forwarding

> [!note]  
> Pas d'exemple précis, car assez technique

Commande qui permet de faire du port forwarding pour expérimenter avec les applications quand on les déploie -> très utile pour des applications qui ne doivent pas être exposées, mais que l'on doit parfois utiliser #[[DaemonSets|Pi-Hole]] **OU** juste pour déboger des [[IngressRoute]] qui ne fonctionnent pas, car un peu bizarre à cause de doc parfois approximative 😡

```bash
kubectl port-forward $RESSOURCE $PORT_HOST:$PORT_KUB
```
