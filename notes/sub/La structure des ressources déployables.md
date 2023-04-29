**Types**:: #🌲  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

Comme dit précédemment dans les avantages de Kubernetes, la force de celui-ci est de pouvoir sauvegarder la configuration de son cluster dans un fichier texte, celui-ci possède alors une structure standardisée que nous allons voir ici

```yaml
apiVersion: apps/v1 # Donne la version du fichier de configuration
kind: bar # Définit le type de ce que l'on veut configurer
metadata: # Ajoute des données supplémentaires au déploiement utilisable par d'autres applications / kubernetes, des métadonées quoi 😁
  name: HelloWorld # Donne un nom à notre config
  namespace: foo # Donne le namespace ou celui-ci va s'appliquer, par defaut kubernets le met dans le namespasce `default`
spec: # La configuration
  ...
```
