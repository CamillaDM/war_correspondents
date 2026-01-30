# Importer et retravailler les données issues de DBPedia dans sa base personnelle SQLite

Cette documentation concerne l'importation de données issues de DBpedia et en lien avec la catégorie "correspondants de guerre". 


## Préparation de la base de données

Il s'agit d'abord de créer une copie de la base de données existante du projet et de renommer cette copie en y ajoutant à la fin "_import".


&nbsp;

## Production des données à importer


### Liste des correspondants de guerre à exporter

* Exécuter la requête suivante sur le [serveur SPARQL de DBpedia](https://dbpedia.org) et choisir d'abord dans *result formats* le format de réponse HTML pour l'inspecter. 
* Puis rééexecuter la requête en choisissant comme *result format* le 'texte séparé par virgule' (CSV).
* Enregistrer le fichier exporté dans un espace dédié (sous-dossier) du dossier de travail.


### Requête sur le serveur SPARQL de DBPedia

    PREFIX dbr: <http://dbpedia.org/resource/>
    PREFIX dbo: <http://dbpedia.org/ontology/>
    PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

    SELECT DISTINCT ?person_uri (STR(?label) AS ?persName) ?birthYear
    WHERE { 
        dbr:List_of_war_correspondents ?p ?person_uri.
        ?person_uri a dbo:Person;
                dbo:birthDate ?birthDate;
                rdfs:label ?label.
        BIND(xsd:integer(SUBSTR(STR(?birthDate), 1, 4)) AS ?birthYear)
        FILTER ( ?birthYear > 1770
                && LANG(?label) = 'en')
    }
    ORDER BY ?birthYear



### Creation de la table dans la base SQLIte

En utilisant DBeaver, sélectionner dans la base de données 'warcorrespondents_import.db' à gauche l'onglet tables et activer par click droit l'import des données, puis suivre les étapes:

* selectionner le fichier CSV à importer qui vient d'être téléchargé à partir de la requête SQL
* dans le dialogue 'CSV' vérifier que le séparateur de colonnes (column delimiter) est bien virgule
* vérifier à la prochaine étape de l'import DBeaver que tout est bien conforme à la structure du CSV
* une nouvelle table sera créée, vous pouvez en modifier le nom sous 'Target' et elle sera appelée: *dbp_liste_personnes* 
* le reste est à laisser comme tel, on peut vérifier dans l'étape 'Confirm' que tout est correct (ou revenir), puis:
* bouton 'Proceed' et la table sera créée
* si erreur dans la table, on l'efface avec DBeaver, click droit sur la table à effacer et 'Delete', et on recommence


&nbsp;

## Importer les personnes


### Vérifier l'absence de doublons

 Chercher les doublons de la table des personnes importée depuis DBpedia. Si on trouve des doublons, c'est-à-dire les mêmes URI plus d'une fois, et donc plusieurs lignes avec différents noms pour la même personne, il est impératif d'éliminer les doublons car la table *person* ne doit comprendre qu'une ligne par individu.
 


    # si le résultat est vide (pas de lignes) il n'y a pas de doublons
    SELECT person_uri
    FROM dbp_liste_personnes lp 
    GROUP BY person_uri
    HAVING COUNT(*) > 1 ;

    -- compter les personnes à importer
    SELECT COUNT(*)
    FROM dbp_liste_personnes lp;


 * Si des doublons son présents, on peut les inspecter, puis  supprimer manuellement les lignes en trop, en en laissant une par personne.
 * Si le nom des doublons est trop important il faudra recourir à cette requête en la mettant à la place de la partie SELECT dans la requête d'insertion des personnes ci-dessous (INSERT INTO person ...) :

        SELECT max(birthYear), person_uri, max(persname),  "Importé le 22 novembre 2025 depuis le résultat d'une requête SPARQL sur DBPedia, cf. astronomers/DBpedia_importer_dans_base_personnelle"
            FROM dbp_liste_personnes lp
            GROUP BY person_uri;


N.B: ouvrir ce document directement dans DBeaver !


&nbsp;

### Insertion des personnes



Si nécessaire vider la table personne en utilisant l'instruction suivante. Mais attention: cette instruction est irréversible ! On peut certes revenir en arrière d'un commit...


    /*
    La ligne est commentée (ajout de "--" avant la commande) afin d'éviter toute erreur de manipulation — décommenter la ligne afin de l'exécuter, puis recommenter.
    
    Ces commandes doivent être exécutées dans DBeaver
    */

    --DELETE FROM "person" ;

    /*
    * Remettre la séquence à zéro
    */
    UPDATE SQLITE_SEQUENCE 
    SET seq = 0
    WHERE name ='person';

    /* 
    après avoir vidé la table exécuter une instruction vacuum afin de vider la mémoire et scories précédentes dans la base de données. Ça libère de l'espace.
    */
    VACUUM;





* ajouter à la table personne la colonne _import_metadata_ and _original_uri_ en utilisant DBeaver
* insérer les personnes avec la requête suivante:

        INSERT INTO person (birth_year, dbpedia_uri, name, import_metadata)
        SELECT birthYear, person_uri, persname, "Importé le 22 novembre 2025 depuis le résultat d'une requête SPARQL sur DBPedia, cf. astronomers/DBpedia_importer_dans_base_personnelle"
        FROM dbp_liste_personnes lp ;    

Noter qu'on a ajouté également une note d'importation qui indique l'origine des données, avec un renvoi à la documentation. 



