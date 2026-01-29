# Catalogue des informations 

Le catalogue des informations a pour objectif de présenter la structure logique de ma recherche. 


##  Objets (avec leurs propriétés)


### Personne
- nom 
- date de naissance
- date de décès
- genre
- origine 
- occupation  
- période d'activité 
- récompense
- appartenance à un réseau professionnel


### Organisation
- nom
- type 
- siège
- fondation


### Occupation 
- nom
- type 


### Lieu
- nom
- type
- coordonnées géographiques 


### Publication
- titre
- année de parution
- type


### Conflit
- nom
- type
- période



### Tag
- nom
- catégorie



<br/>

## Relations entre objets



### Vie et carrière
- personne est née dans lieu
- personne est décédée dans lieu 
- personne est de tel genre
- personne a étudié à organisation 
- personne poursuit occupation
- personne exerce pour organisation 


### Appartenances et réseaux
- personne est membre de organisation 
- organisation est située dans lieu
- personne est caractérisée par récompense


### Couverture et production
- personne a couvert événement
- personne est auteur de publication
- publication traite de conflit
- personne a été envoyée par organisation pour couvrir conflit

 
 ## Exemple d'instanciation 



### Objet (individu)
- personne : Catherine Leroy
- organisation : Associated Press
- lieu : Vietnam
- occupation: war correspondent
- conflit : Vietnam War


### Relations
- Catherine Leroy est née à Sannois 
- Catherine Leroy est une femme
- Catherine Leroy travaille pour l'Associated press
- Catherine Leroy couvre la Vietnam War
- Associated Press a envoyé Catherine Leroy pour couvrir la Vietnam War 