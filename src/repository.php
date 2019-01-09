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

function writeArticle(PDO $db)
{
$statement = $db->prepare('INSERT INTO billet(titre, texte, datePublication) VALUES(:titre, :texte, :datePublication)');
 if(isset($_POST["add"])){
  $err = $statement->execute(array(
  	'titre' => $_POST["titre"],
  	'texte' => $_POST["texte"],
    'datePublication'  => $_POST["datePublication"],
  	));
    }
  return $statement;
}


function displayArticle (PDO $db)
{
  $statement = $db->prepare("SELECT B.`id`, B.`titre`,B.`texte`, B.`datePublication`,U.`nom`,U.`prenom`
FROM `billet` as B
LEFT JOIN `utilisateur` as U ON U.`id` = B.`auteur`
ORDER BY `datePublication`
DESC LIMIT 3");
$err = $statement->execute();

  return $statement->fetchAll(PDO::FETCH_ASSOC);
}

function displayOnearticle (PDO $db,$idNum)
{
$statement = $db->prepare("SELECT B.`id`, B.`titre`,B.`texte`, B.`datePublication`,U.`nom`,U.`prenom`
FROM `billet` as B
LEFT JOIN `utilisateur` as U ON U.`id` = B.`auteur`
WHERE B.`id`= $idNum");
$err = $statement->execute();

return $statement->fetchAll(PDO::FETCH_ASSOC);
}




?>
