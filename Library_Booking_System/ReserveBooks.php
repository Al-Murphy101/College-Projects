<?php
session_start();
$message="";
?>
<?php
		$db = new mysqli('localhost', 'root', '', 'my_library') or die(mysqli_error());
		if (isset($_POST['ISBN']) && isset($_POST['username'])) {
			 $ISBN = mysqli_real_escape_string($db, $_POST['ISBN']);
			 $username = mysqli_real_escape_string($db, $_POST['username']);
			 $sql= "INSERT INTO reserve (ISBN, username, reserveDate) VALUES ('$ISBN', '$username', now())";
			 mysqli_query($db,$sql);
			 header("Location:delete.php");
			 return;
		 }
		 
		
?>
		