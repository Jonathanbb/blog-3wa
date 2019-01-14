<?php
session_start();
include "../admin/src/repository.php";
include "../admin/src/users.php";

$idNum = $_GET["id"];// cf index.phtml l.16, reférence à l'url du lien généré

$db = openDatabase('blog', 'root', 'troiswa');
/*$article = writeArticle($db);
var_dump($article);
var_dump($_POST);*/

/*$author = addAuthor($db);
var_dump($author);*/

//var_dump($_SESSION);

$oneArticle = displayOnearticle ($db,$idNum);
/*$comment = writeComment ($db);
var_dump($comment);
var_dump($_POST);
$productArticle = displayArticle ($db);
$contactAuthor = displayAuthor($db);*/

$showComment = displayComment($db,$_GET['id']);
//comme 2e argument (id) dans displayComment on renseigne get(id) qui correspond à l'url voulu (cf l.51 repository.php)
//var_dump($showComment);



$template = "../templates/single.phtml";
include "../templates/base.phtml";
