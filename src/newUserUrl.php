<?php
session_start();
include "../admin/src/repository.php";
if (empty($_POST)) {
  $template = "../templates/users.php";
  include "../templates/base.phtml";
} else {
  $db = openDatabase('blog','root','troiswa');
  $db->query('SET NAMES UTF8');
  $err = addUser ($db);
  $id = $db->lastInsertId();
  header("Location: http://localhost/developpement/php/blog/src/newUser.php?id=$id"); // Redirection HTTP
}
?>
