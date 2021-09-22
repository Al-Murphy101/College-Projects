<?php
session_start();
$message="";
?>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
</head>
	
<body>
	<h1>Stanley Library Reservations</h1>
	
	<div class="imgcontainer">
		<img src="login_avatar_1.png" alt="Avatar" class="avatar">
	</div>
	<br>
		<?php
		$db = mysqli_connect('localhost', 'root', '', 'my_library') or die(mysqli_error()); 
		$sql = "select * from reserve";
		$result = $db->query($sql);
		echo '<table border="1">'."\n";

		if ($result->num_rows > 0) {
		?>
		
<div class="container">
	<?php
			if($_SESSION["firstname"]) {
	?>
			<h2><?php echo $_SESSION["firstname"]; ?>. Please click here to <a href="logout.php" tite="Logout">Logout.</a></h2>
	<?php
	}		else echo "<h1>Please login first .</h1>";
	?>
		
	<div id ="displaybooks"class="container">
	<table border="2" align="center" cellpadding="5" cellspacing="5">
		<tr>
			<th> ISBN </th>
			<th> User Name </th>
			<th> Reserve Date </th>
			<th> Select </th>
			<th> Delete </th>
		</tr>
	</div>

	<div class="container">
	<?php while($row = mysqli_fetch_assoc($result))
	{
	?>

		<tr>
			<td><?php echo $row["ISBN"];?> </td>
			<td><?php echo $row["userName"];?> </td>
			<td><?php echo $row["reserveDate"];?> </td>
			<td><input type="checkbox" name="select" value="select"></td>
			<td><button type="button" name="id"><a href="deletes.php">Delete</a></button>
			
		</tr>
	</div>


	<?php
	}
	}
	?>
</table>
<br>
<br>
<br>
<br>
</body>
</html>