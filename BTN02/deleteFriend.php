<?php 
require_once("init.php");
require_once("function.php");

if(!$currentUser)
{
    header('Location: login.php');
    die();
}

if (!empty($_GET['id']))
{
    $target = $_GET['id'];
    if ($target != $currentUser['ID'])
    {
        deleteRequest($currentUser['ID'],$target);
        deleteRequest($target,$currentUser['ID']);
    }
}

header('Location: ' . $_SERVER['HTTP_REFERER']); 