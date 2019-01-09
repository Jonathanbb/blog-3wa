<?php


/*function addAuthor(PDO $db)
{
  $statement = $db->prepare('INSERT INTO utilisateur(nom, prenom, email) VALUES(:nom, :prenom, :email)');
  if(isset($_POST["add"])){
    $err = $statement->execute(array(
  	'nom' => $_POST["nom"],
  	'prenom' => $_POST["prenom"],
    'email'  => $_POST["email"],
  	));
    }
  return $statement;
}*/


function displayAuthor (PDO $db)
{
  $statement = $db->prepare("SELECT * FROM `utilisateur`");
  $err = $statement->execute();

  return $statement->fetchAll(PDO::FETCH_ASSOC);
}



?>
