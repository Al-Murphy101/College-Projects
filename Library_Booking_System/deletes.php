<?php
	
	session_start();
	$message="";
	
	include_once("db.php");
	
	
	$id = mysqli_real_escape_string($db, $_GET['id']);

	echo $id;
	$result = mysqli_query($db,"SELECT id, ISBN, userName, reserveDate FROM reserve WHERE id='$id'");
	$row = mysqli_fetch_row($result);


	$sql= "DELETE FROM `reserve` WHERE `reserve`.`id` = $id";
	echo "<pre>\n$sql\n</pre>\n";
	mysqli_query($db,$sql);
	echo 'Success -<a href="SearchBooks.php">Continue...</a>';
	return;


?>


