<?php
session_start();
?>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="style.css">
		<title>Search Books</title>
	</head>
<body>

<h1>Search Stanley Library Below</</h1>
<br>
<br>

	<div class="imgcontainer">
		<img src="login_avatar_1.png" alt="Avatar" class="avatar">
	</div>

	<div class="container">
	<?php
		if($_SESSION["firstname"]) {
	?>
			<h4>Hello <?php echo $_SESSION["firstname"]; ?>. Click here to <a href="SearchBooks.php" title="searchbooks">Search Books.</h4> 
	<?php
	}	else echo "<h1>Please login first .</h1>";
	?>
	
</div>
</body>
</html>