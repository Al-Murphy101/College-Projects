<?php

	include_once 'db.php';
	
	$username = $_POST['username'];
	$password = $_POST['password'];
	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$addressline1 = $_POST['addressline1'];
	$addressline2 = $_POST['addressline2'];
	$city = $_POST['city'];
	$telephone = $_POST['telephone'];
	$mobile = $_POST['mobile'];
	

	$sql = "INSERT INTO users (username, password, firstname, lastname, addressline1, addressline2, city, telephone, mobile) 
			VALUES ('$username','$password','$firstname','$lastname','$addressline1', '$addressline2','$city', '$telephone', '$mobile');"; 

	mysqli_query($db, $sql);

	header("Location: login.php?signup=success");
	
?>