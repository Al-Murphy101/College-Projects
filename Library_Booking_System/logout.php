<?php
session_start();
unset($_SESSION["username"]);
unset($_SESSION["firstname"]);
header("Location:login.php");
?>