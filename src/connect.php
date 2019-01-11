<?php

include "../admin/src/repository.php";
session_start();
$db = openDatabase('blog', 'root', 'troiswa');

if (empty($_POST)) {
  $template = "../templates/connect.phtml";
  include "../templates/base.phtml";
} else {
  $db = openDatabase('blog','root','troiswa');
  $user = findUserByPseudo($db, $_POST['pseudo']);
  if (empty($user)) {
    header('Location: connect.php');
  } else {
    if ($user['mot_de_passe'] === $_POST['mot_de_passe']) {
      session_abort();
      session_start();
      $_SESSION['user'] = $user;
      //var_dump($_SESSION); die;
      header('Location: index.php');
    } else {
      header('Location: connect.php');
    }
  }
  // Comparer le mot de passe avec la valeur dans le formulaire
}

/*$author = addAuthor($db);
var_dump($author);*/

/*function displayAuthor (PDO $db)
{
  $statement = $db->prepare("SELECT * FROM `utilisateur`");
  $err = $statement->execute();

  return $statement->fetchAll(PDO::FETCH_ASSOC);
}*/

?>
