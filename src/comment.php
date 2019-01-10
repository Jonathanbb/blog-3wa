<?php

include "../admin/src/repository.php";
include "../admin/src/users.php";

$db = openDatabase('blog', 'root', 'troiswa');
/*$article = writeArticle($db);
var_dump($article);
var_dump($_POST);*/

/*$author = addAuthor($db);
var_dump($author);*/

// var_dump($_POST);
// die;
$comment = writeComment ($db);
var_dump($comment);
/*$productArticle = displayArticle ($db);
$contactAuthor = displayAuthor($db);*/

//$template = "../templates/single.phtml";
//include "../templates/base.phtml";

header("Location: single.php?id=".$_POST['billet']);//on renseigne la valeur de l'id pour que le commentaire publié
//corresponde à l'article correspondant et soit redirigé vers son url
