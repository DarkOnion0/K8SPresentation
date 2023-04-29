**Types**:: #🌲, #⏳  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Fetching Title#5zhd](https://en.wikipedia.org/wiki/YAML)
%%

Kubernetes utilise le [YAML](https://en.wikipedia.org/wiki/YAML) pour toute sa configuration, une petite introduction s'impose donc. Le [YAML](https://en.wikipedia.org/wiki/YAML) est similaire au JSON, mais est fait pour être _pratique à utiliser pour l'Homme_.

```yaml
foo: hello world # Une clé d'un dictionnaire en chaine de caractère
bar: 123456789 # Une clé d'un dictionnaire en nombre
baz: # Une clé d'un dictionnaire contenant elle aussi un dictionnaire
	foo: 💙 nixos # Une clé d'un dictionnaire en chaine de caractère
	bar: # Une clé d'un dictionnaire contenant une liste
	  - foo # Un élément de liste sous la forme d'une chaine de caractère
	  - 123 # Un élément de liste sous la forme d'un nombre
	  - baz: test # Un élément de liste représentant un dictionnaire, avec 1 clé et sa valeur sous la forme d'une chaine de caractère

--- # Sépare 2 documents YAML, ca reviendrait à créer 2 fichiers séparée et à importer les 2. C'est très pratique pour regroupper plusieurs configs dans le meme fichier

data: | # Permet d'écrire du texte sur plusiers ligne, c'est pratique pour configurer des fichiers dans les ConfigMaps
   There once was a tall man from Ealing
   Who got on a bus to Darjeeling
       It said on the door
       "Please don't sit on the floor"
   So he carefully sat on the ceiling
```
