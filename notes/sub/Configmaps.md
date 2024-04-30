**Types**:: #🌲, #⏳  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[https://www.oreilly.com/library/cover/9781098110192/](https://www.oreilly.com/library/cover/9781098110192/)
[ConfigMaps | Kubernetes](https://kubernetes.io/docs/concepts/configuration/configmap/)
%%

# Intro

> [!info]  
> Une Configmaps ne peut pas contenir plus de 1Mo de données

> [!tip]  
> Une Configmaps peut aussi permettre de décentraliser [[Secrets & ENV Vars|les variables d'environnement]] du code de déploiement du conteneur, \#[How To Handle Environment Variables With Kubernetes? | Humanitec](https://humanitec.com/blog/handling-environment-variables-with-kubernetes)

Une Configmaps est une sorte de système de fichiers déclaratif pour Kubernetes, en d'autres termes quand on utilisait des [[Secrets & ENV Vars|variables d'environnement]], on passait des petites données, alors qu'une Configmaps en passe des plus grosses, des fichiers entiers.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: game-demo
data: # Les données à définir
  # Ce sont des valeurs définies comme des variables d'environnement; chaque clé fait référence à une valeur simple
  player_initial_lives: "3"
  ui_properties_file_name: "user-interface.properties"

  # Ce sont des valeurs semblables à des fichiers
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: kuard
  template:
    metadata:
      labels:
        app: kuard
    spec:
      containers:
        - name: kuard
          image: gcr.io/kuar-demo/kuard-amd64:blue
		  env: # Définit des variables d'environnement
		    - name: BAR # Le nom de la variable
		      valueFrom: # Indique que la valeur doit être cherchée dans un autre fichier
                configMapKeyRef: # Dit qu'il s'agit d'une Configmaps
                  name: foobar # Le nom du Configmaps /!\ Il faut que le Configmaps soit dans le même namespace que celui du deployment /!\
                  key: BAR # Indique quelle valeur prendre dans la Configmaps
		 volumeMounts: # Monte la configmaps
		    - name: foobarbaz
		      mountPath: /config
	  volumes:
	    - name: foobarbaz
	      configMap: # Précise que le volume est du genre configmaps
	        name: qux # indique le nom de la configmaps
```

# Manip

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: kuard
  namespace: default
data:
  FOO: HelloWorld
  BAR: "Kubernetes is cool, isn't it ? :)"
  k8s.md: |
    **💙 K8S 💙**
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard-configmaps
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: kuard-configmaps
  template:
    metadata:
      labels:
        app: kuard-configmaps
    spec:
      containers:
        - name: kuard-configmaps
          image: gcr.io/kuar-demo/kuard-amd64:blue
		  env:
		    - name: FOO
		      valueFrom:
			    configMapKeyRef:
			      name: kuard
			      key: FOO
		    - name: BAR
		      valueFrom:
			    configMapKeyRef:
			      name: kuard
			      key: BAR
	      volumeMounts:
		    - name: kuard-config-volume
		      mountPath: /config
	  volumes:
	    - name: kuard-config-volume
	      configMap:
	        name: kuard
```

1. `kubectl apply -f [PATH_TO_FILE]/kuard_configmap.yaml`
2. `kubectl get configmaps`
3. `kubectl get pods --watch` -> attendre que cela retourne ready
4. `kubectl port-forward kuard-… 8080:8080` -> permet d'accéder à l'application, c'est comme du port forwarding avec ssh
5. Aller sur [http://localhost:8080/-/env](http://localhost:8080/-/env)
6. Aller sur [http://localhost:8080/fs/](http://localhost:8080/fs/)
7. Aller dans le dossier config et regarder les fichiers de la configmap
8. ✨ It works !!! ✨
