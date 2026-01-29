Ce document contient le commentaire, avec exemples, du modèle conceptuel

## Person

Tout correspondant.e de guerre, quelle que soit sa nationalité ou sa période d'activité.

### Propriétés
Nom standard, notice, le genre, nationalité.


## Occupation

Un métier ou tout autre type d'occupation
Il s'agit d'une classe objet (persistent item)

### Propriétés
Nom standard, notice



## Pursuit

Le fait d'exercer une activité journalistique spécifique durant une période donnée. 


### Relations

Une _Pursuit_ peut comprend une et une seule personne, une et une seule occupation (ces deux relations sont nécessaires) et éventuellement on peut associer une (et une seule) organisation auprès de laquelle l'activité est exercée.

Il est aussi possible d'y asscoier un lieu géographique qui représente une zone de conflit, une période d'activité, et éventuellement une oeuvre. 



## Organization

Une institution ou entreprise journalistique, de presse ou aduiovisuelle, auprès de laquelle un correspodant exerce son activité.


### Propriétés

Nom standard
Type
Siège ou zone géographique
Date de fondation
Orientation ou ligne éditoriale


### Relations

Une organisation peut employer plusieurs personnes. 
Une poursuit peut être rattachée à plusieurs organisation.



## Lieu/zone de guerre
????


## Reportage

Un contenu journalistique produit par un correspondant de guerre. 


### Propriétés

Titre
Année de publication
Type de média
Sujet
Langue
Média de publication
Récompenses éventuelles


### Relations

Un reportage a pour auteur une person.
Un reportage peut être produit durant une pursuit.
Un reportage peut être publié par une organization. 

## Tag