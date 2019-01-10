<?php

/**
 * Ouvre une connexion à la base de données
 *
 * @param  string $database [description]
 * @param  string $user     [description]
 * @param  string $password [description]
 * @return PDO              [description]
 */
function openDatabase(string $database, string $user, string $password) : PDO
{
  return new PDO("mysql:host=localhost;dbname=$database", 'root', 'troiswa');
}

function writeArticle(PDO $db)//l.25 fait référence à fonction uploadFile "insert into"(l.19) permet de rentrer valeurs dans formulaire qui seront seront sauvegardées dans sql
{
$statement = $db->prepare('INSERT INTO billet(titre, texte, datePublication, image, categorie) VALUES(:titre, :texte, :datePublication, :image, :categorie)');
 if(isset($_POST["add"])){
  $err = $statement->execute(array(
  	'titre' => $_POST["titre"],
  	'texte' => $_POST["texte"],
    'datePublication'  => $_POST["datePublication"],
    'image'  => $_FILES["image"]['name'],
    'categorie'  => $_POST["categorie"],
  	));
    uploadFile($_FILES['image']);
    //var_dump($_FILES);
    }
  return $statement;
}

function writeComment (PDO $db)
{
  $statement = $db->prepare('INSERT INTO commentaire(texte, billet) VALUES(:texte, :billet)');
   if(isset($_POST["add"])){
    $err = $statement->execute(array(
    	'texte' => $_POST["texte"],
      'billet'=> $_POST["billet"],
    	));
      }
    return $statement;
}

function displayComment (PDO $db, string $id)
{
$statement = $db->prepare("SELECT *
FROM `commentaire` AS C
WHERE C.`billet` = ?
");
$err = $statement->execute([$id]);
return $statement->fetchAll(PDO::FETCH_ASSOC);
}

// l.48 prend en compte le fait que nous souhaitons une valeure spécifique pour ce champ, et permettra que
// l'info demandée ne s'affiche que quand le champs selectionné a une certaine valeur (en l'occurence l'id lié
// entre billet et commentaire)

function uploadFile(array $file)//affecte un bon chemin relatif à l'image recherchée en générant tableau relatif à l'image
// Important : faire var_dump($_FILES) pour comprendre la fonction en voyant le tableau généré.
// cf : l.29 ; après avoir rentré image dans formulaire, on pourra voir le tableau
{
  $fileName = $file['name'];
  $tmp = $file['tmp_name'];
  move_uploaded_file($tmp, '/home/wamont2-3/sites/developpement/php/blog/img/'.basename($fileName));
}




/*function displayArticle (PDO $db)//on selectionne id l.48 et l.50 pour pouvoir créer un lien
{
$statement = $db->prepare("SELECT B.`id`, B.`titre`,B.`texte`, B.`datePublication`, B.`image`, U.`nom`,U.`prenom`
FROM `billet` as B
LEFT JOIN `utilisateur` as U ON U.`id` = B.`auteur`
ORDER BY `datePublication`
DESC LIMIT 6");
$err = $statement->execute();

  return $statement->fetchAll(PDO::FETCH_ASSOC);
}*/

function displayArticle (PDO $db)//on selectionne id l.48 et l.50 pour pouvoir créer un lien
{
$statement = $db->prepare("SELECT B.`id`, B.`titre`,B.`texte`, B.`datePublication`, B.`image`,
B.`categorie`, B.`dateCreation`, C.`name`, U.`nom`,U.`prenom`
FROM `billet` as B
LEFT JOIN `utilisateur` as U ON U.`id` = B.`auteur`
LEFT JOIN `categories` as C ON C.`id` = B.`categorie`
ORDER BY `dateCreation` DESC
LIMIT 6");

$err = $statement->execute();
return $statement->fetchAll(PDO::FETCH_ASSOC);
}



function displayOnearticle (PDO $db,$idNum)
{
$statement = $db->prepare("SELECT B.`id`, B.`titre`,B.`texte`, B.`datePublication`, B.`image`, B.`dateCreation`, U.`nom`,U.`prenom`
FROM `billet` as B
LEFT JOIN `utilisateur` as U ON U.`id` = B.`auteur`
WHERE B.`id`= $idNum");
$err = $statement->execute();

return $statement->fetch(PDO::FETCH_ASSOC);//FETCH (sans all) permet de n'afficher qu'un article
//Du coup, plus besoin de faire une boucle foreach dans single.phtml!
}






?>
