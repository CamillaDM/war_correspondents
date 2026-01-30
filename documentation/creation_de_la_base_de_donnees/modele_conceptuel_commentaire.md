# Coommentaire du modèle conceptuel

Ce document contient le commentaire, avec exemples, du modèle conceptuel.

## Person

Tout correspondant.e de guerre, quelle que soit sa nationalité ou sa période d'activité.
Ex: "Alors que Roger Auque est correspondant de guerre, (..)".

### Propriétés
Nom , notice, genre. 
Il s'agit d'une classe objet (persistent item)


## Occupation

Un métier ou tout autre type d'occupation.
Il s'agit d'une classe objet (persistent item).

### Propriétés
Nom, notice, spécialisation.

### Relations
Une relation réflexione de spécialisation.
Ex: "correspondant de guerre" spécialise le terme de "reporter".




## Pursuit

Le fait d'exercer une telle activité ou occupation durant une période donnée. 
Ex: "De 1982 à 2002, Roger Auque est journaliste et grand reporter pour RTL".

### Relations
Une _Pursuit_ peut comprend une et une seule personne, une et une seule occupation (ces deux relations sont nécessaires) et une et une seule organisation auprès de laquelle l'activité est exercée.

Il est aussi possible d'y asscoier un lieu géographique qui représente une zone de conflit, une période d'activité, et éventuellement une oeuvre. 
Ex: "De 2003 à 2007, Roger Auque est correspondant permanent à Bagdad."


## Organization

Une institution, une entreprise journalistique, de presse ou aduiovisuelle, auprès de laquelle un correspodant exerce son activité.
Ex: "Sipa Press est une agence française de photojournalisme qui a été fondée en 1973."


### Propriétés
Nom, type, siège ou zone géographique, date de fondation, date de dissolution.


### Relations
Une organisation peut employer plusieurs personnes. 
Une poursuit peut être rattachée à plusieurs organisation.


## Membership
Il s'agit de l'appartenance d'un individu à une organisation pendant une certaine période.

### Propriétés
Date de début, date de fin, type.

### Relations
Une membership relie une person à une organisation.
Elle est qualifiée par un membership_type.
Ex: "En mai Gilles Caron travaille à Paris pour l’agence de mode Photographic Service dirigée par Giancarlo Botti".


## Lieu/zone de guerre

Il s'agit d'un événement historique localisé dans le temps et l'espace qui sert de cadre aux activités des correspondants. 


### Propriétés
Nom, date de début, date de fin. 

### Relations
Une zone de guerre est liée à une ou plusieurs place géographique.
Elle sert de contexte de référence pour les pursuit et les tag.


## Publication

Il s'agit du résultat concret de l'activité journalistique (un article, un livre, un reportage photographique). 

### Propriétés
Titre, année, type.
Il s'agit d'une classe objet (persistent item).

### Relations

Une publication a pour auteur une seule person.
Une publication est produite durant une pursuit.


## Tag

Un mot clé qui introduit un classement de recherche, généralement lié au questionnement.

### Relations
Relation reflexive (d'un classe vers elle même) qui créer une taxonomie (i.e. une hiérarchie) de mots clés, les plus généraux étant les parents ou ancêtres des plus spécifiques.