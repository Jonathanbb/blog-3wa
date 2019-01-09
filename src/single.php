<?php

include "repository.php";
include "users.php";

$idNum = $_GET["id"];
$db = openDatabase('blog', 'root', 'troiswa');
/*$article = writeArticle($db);
var_dump($article);
var_dump($_POST);*/

/*$author = addAuthor($db);
var_dump($author);*/

$oneArticle = displayOnearticle ($db,$idNum);

/*$productArticle = displayArticle ($db);
$contactAuthor = displayAuthor($db);*/

$template = "../templates/single.phtml";
include "../templates/base.phtml";
