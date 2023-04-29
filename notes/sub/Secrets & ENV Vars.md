**Types**:: #🌲  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Secrets | Kubernetes](https://kubernetes.io/docs/concepts/configuration/secret/)
[Managing Secrets using Configuration File | Kubernetes](https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-config-file/)
[Kubernetes Secrets - What is the purpose of type "Opaque" in secret definitions - Stack Overflow](https://stackoverflow.com/questions/45120359/kubernetes-secrets-what-is-the-purpose-of-type-opaque-in-secret-definitions)
[Base64 — Wikipédia](https://fr.wikipedia.org/wiki/Base64)
%%

# Intro

Commençons tout d'abord par parler des variables d'environnement. Dans le paradigme des conteneurs et donc de K8S, c'est **LE** moyen primaire de configurer les choses, passer des valeurs avec le conteneur…

Dans K8S, un secret est une [[Configmaps]] spécialement conçue pour contenir des données sensibles, leur utilisation la plus courante dans notre cas d'auto-hébergement sera de contenir les jetons d'authentifications, elles seront donc plus utilisées comme variables d'environnement que comme un moyen de passer des fichiers au conteneur.

> [!warning]  
> [Base64 — Wikipédia](https://fr.wikipedia.org/wiki/Base64) est un encodage **PAS UN CHIFFREMENT**, on peut donc retrouver la valeur originale d'une chaine encodée en base 64 avec la commande suivante sans aucun problème
>
> ```bash
> echo "BASE64_STRING" | base64 --decode
> ```

Les champs dans les secrets sont encodés en base64 pour des raisons techniques [^1]. Sous Linux on peut utiliser la commande suivante

```bash
echo "MY_SUPER_SECRET_VALUE" | base64 -w 0
```

> [!warning]  
> Par défaut les secrets ne sont pas chiffrés quand ils sont stockés dans Kubernetes, des configurations supplémentaires sont nécessaires \#[Secrets Encryption | K3s](https://docs.k3s.io/security/secrets-encryption) / \#[Secrets | Kubernetes](https://kubernetes.io/docs/concepts/configuration/secret/)

---

> [!note]  
> Config for `Opaque`

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque # Dit que le secret peut contenir des valeurs arbitraires
data: # Contient les datas du secret
  username: YWRtaW4= # Chaine en bas64 -> admin
  password: MWYyZDFlMmU2N2Rm # Chaine en base64 -> 1f2d1e2e67df
```

> [!note]  
> Config for `dockerconfigjson` \#[Pull an Image from a Private Registry | Kubernetes](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: myregistrykey
  namespace: awesomeapps
type: kubernetes.io/dockerconfigjson # Dit que le secret contient des identifiants à un registry sous format JSON
data:
  .dockerconfigjson: UmVhbGx5IHJlYWxseSByZWVlZWVlZWVlZWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGx5eXl5eXl5eXl5eXl5eXl5eXl5eSBsbGxsbGxsbGxsbGxsbG9vb29vb29vb29vb29vb29vb29vb29vb29vb25ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubmdnZ2dnZ2dnZ2dnZ2dnZ2dnZ2cgYXV0aCBrZXlzCg== # Chaine en base64 -> Really really reeeeeeeeeeaaaaaaaaaaaaaaaaaaaaaaaaaaalllllllllllllllllllllllllllllllyyyyyyyyyyyyyyyyyyyy llllllllllllllooooooooooooooooooooooooooonnnnnnnnnnnnnnnnnnnnnnnnggggggggggggggggggg auth keys
```

---

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
		  env: # Définit des varibles d'environement
		    - name: FOO # Le nom de la variable
		      value: HelloWorld # Sa valeur

		    - name: BAR # Le nom de la variable
		      valueFrom: # Indique que la valeur doit être cherchée dans un autre fichier
                secretKeyRef: # Dit qu'il s'agit d'un secret
                  name: kuard # Le nom du secret /!\ Il faut que le secret soit dans le même namespace que celui du deployment /!\
                  key: BAR # Indique quelle valeur prendre dans le secret
```

[^1]: [kubernetes - Why does k8s secrets need to be base64 encoded when configmaps does not? - Stack Overflow](https://stackoverflow.com/questions/49046439/why-does-k8s-secrets-need-to-be-base64-encoded-when-configmaps-does-not)

# Manip

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: kuard
  namespace: default
type: Opaque
data:
	BAR: S3ViZXJuZXRlcyBpcyBjb29sLCBpc24ndCBpdCA/IDopCg== # Kubernetes is cool, isn't it ? :)
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard-secret
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: kuard-secret
  template:
    metadata:
      labels:
        app: kuard-secret
    spec:
      containers:
        - name: kuard-secret
          image: gcr.io/kuar-demo/kuard-amd64:blue
	      ports:
	        - containerPort: 80
	          hostPort: 8080
	          protocol: TCP
	          name: web
		  env:
		    - name: FOO
		      value: HelloWorld
		    - name: BAR
		      valueFrom:
                secretKeyRef:
                  name: kuard
                  key: BAR
```

1. `kubectl apply -f [PATH_TO_FILE]/kuard_sec.yaml`
2. `kubectl get secret`
3. `kubectl get pods --watch` -> attendre que cela retourne ready
4. `kubectl port-forward kuard-… 8080:8080` -> permet d'accéder à l'application, c'est comme du port forwarding avec ssh
5. Aller sur [http://localhost:8080/-/env](http://localhost:8080/-/env)
6. ✨ It works !!! ✨
