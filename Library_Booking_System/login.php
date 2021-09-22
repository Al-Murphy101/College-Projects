<?php
session_start();
$message="";
	if(count($_POST)>0) {
		$con = mysqli_connect('localhost','root','','my_library') or die('Unable To connect');
		$result = mysqli_query($con,"SELECT * FROM users WHERE username='" . $_POST["username"] . "' and password = '". $_POST["password"]."'");
		$row  = mysqli_fetch_array($result);
	if(is_array($row)) {
		$_SESSION["username"] = $row['username'];
		$_SESSION["firstname"] = $row['firstname'];
		} else {
			$message = "Invalid Username or Password!";
		}
}
	if(isset($_SESSION["username"])) {
		header("Location:index.php");
}
?>

<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="style.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	</head>

<body>

<h1>Stanley Library Login</h1>

	<form action="" method="post">
		<div class="imgcontainer">
			<img src="login_avatar_1.png" alt="Avatar" class="avatar">
		</div>

		<div class="container">
			<label for="uname"><b>Username</b></label>
			<input type="text" placeholder="Enter Username" name="username" required>

			<label for="psw"><b>Password</b></label>
			<input type="password" placeholder="Enter Password" name="password" required>
			
			<button type="submit">Login</button>
			<label>
			<h3>Please click here to <a href="register.php" tite="register">Register.</h3>
			</label>
		</div>
	</form>
</body>
</html>