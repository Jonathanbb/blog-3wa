<?php

include "../admin/src/repository.php";
include "users.php";

$db = openDatabase('blog', 'root', 'troiswa');
$article = writeArticle($db);
/*var_dump($article);
var_dump($_POST);*/

/*$author = addAuthor($db);
var_dump($author);*/



$productArticle = displayArticle ($db);
/*$contactAuthor = displayAuthor($db);*/
//var_dump($productArticle);

$template = "../templates/index.phtml";
include "../templates/base.phtml";
