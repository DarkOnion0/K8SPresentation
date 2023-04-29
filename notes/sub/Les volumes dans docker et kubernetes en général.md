**Types**:: #🌲  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Volumes | Kubernetes](https://kubernetes.io/docs/concepts/storage/volumes/)
%%

Dans docker et Kubernetes un _volume_ est un moyen de stocker des informations à travers les différentes reboot / update d'un [[Pods]]. Si dans docker les volumes sont juste de simples dossiers la plupart du temps, l'aspect dynamique de K8S a poussé le concept un peu plus loin.  
Ainsi, on peut voir les volumes comme des partitions Linux que l'on monte dans un conteneur.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: foo
spec:
  containers:
  - name: bar
    image: baz
	volumeMounts: # Monte un volume dans le conteneur
      - name: quz # Prends le volume importé dans le pods du nom de `quz`
        mountPath: /config # Monte le volume dans `/config`
  volumes: # Définit les volumes dans un pod
    - name: quz # Crééer un volume du nom `quz`
      {{ .StorageType }} # Les configs spécifiques aux types de volumes
```

Let's go to [[Storage]]
