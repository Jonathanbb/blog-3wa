<?php
session_start();
include "../admin/src/repository.php";
$id = $_GET['id'];

$db = openDatabase('blog','root','troiswa');
$db->query('SET NAMES UTF8');
$user = findUser($db, $id);

$template = "../templates/newUser.phtml";
include "../templates/base.phtml";

?>
