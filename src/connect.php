<?php

include "../admin/src/repository.php";


$db = openDatabase('blog', 'root', 'troiswa');

/*$author = addAuthor($db);
var_dump($author);*/

/*function displayAuthor (PDO $db)
{
  $statement = $db->prepare("SELECT * FROM `utilisateur`");
  $err = $statement->execute();

  return $statement->fetchAll(PDO::FETCH_ASSOC);
}*/

$template = "../templates/connect.phtml";
include "../templates/base.phtml";

?>
