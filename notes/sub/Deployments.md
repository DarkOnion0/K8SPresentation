**Types**:: #🌲  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[https://www.oreilly.com/library/cover/9781098110192/](https://www.oreilly.com/library/cover/9781098110192/)
[Deployments | Kubernetes](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
%%

# Présentation

Le _deployments_ est le moyen le plus simple pour déployer un _workload_ sur Kubernetes.

Elle est chargée de gérer les états des pods et autres éléments nécessaires au bon fonctionnement de l'application déployée

# Manip

## Analyse Du Fichier

> [!info]  
> Pour la structure générique revenir à [[La structure des ressources déployables]]

> [!tip]  
> La structure du fichier de déploiement inclus le schéma du [[Pods]] dans sa configuration, c'est pourquoi on retrouve `.spec.template.spec`.
> Un déployement est ainsi comme un ensemble dans lequel l'ensemble de pod est inclus
>
> $$
> \text{pods config} \subset \text{deployment config}
> $$

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard-deployment
  namespace: default
spec:
  replicas: 1 # Paramètre le deployment, lui indique combien de pods doit-il générer, 1 par défaux
  selector: # Paramètre le deployment, lui indique quel pod il doit manager
    matchLabels:
      app: kuard-deployment
  template: # Le fichier de config du pod -> [Pods | Kubernetes](https://kubernetes.io/docs/concepts/workloads/pods/#pod-templates)
    metadata:
      labels:
        app: kuard-deployment
    spec:
      containers:
        - name: kuard-deployment
          image: gcr.io/kuar-demo/kuard-amd64:blue
	      ports:
	        - containerPort: 80 # Le port à exposer
	          hostPort: 8080 # Le port exposé sur un noeud
	          protocol: TCP
	          name: web # Donne un nom au port pour le retrouver plus simplement
```

## Déploiement

1. `kubectl apply -f [PATH_TO_FILE]/kuard.yaml`
2. `kubectl get deployments -o wide --watch` -> attendre que cela retourne ready
3. `kubectl get pods` -> voir que le pod est bien créé en parallèle
   [4. `kubectl port-forward kuard-… 8080:8080` -> permet d'accéder à l'application, c'est comme du port forwarding avec ssh]()
4. Aller sur [http://localhost:8080/](http://localhost:8080/)
5. ✨ It works !!! ✨

## Test

1. `kubectl get deployments -o wide --watch` et `kubectl get pods --watch` -> exécuter les commandes dans des nouveaux terminaux
2. `kubectl delete pods kuard-…` -> essayez de supprimer le pods
3. Le pod est recréé => un des roles du deployments
4. ✨ It works !!! ✨
