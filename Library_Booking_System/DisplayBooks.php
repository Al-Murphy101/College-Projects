<?php
session_start();
?>

<!DOCTYPE HTML>
<html>
	<head>
		<link rel="stylesheet" href="style.css">
	</head>

<body>
	<center><h1>Stanley Library Search Results</h1></center>

	<div class="imgcontainer">
		<img src="result.png" alt="Avatar" class="avatar">
	</div>
<br>
	

<?php
	include_once("db.php");

	$search = $_REQUEST["search"];


	$query = "SELECT * FROM books WHERE bookTitle LIKE '%$search%'";
	$result = mysqli_query($db,$query);

	if(mysqli_num_rows($result)>0)if(mysqli_num_rows($result)>0)

	{
?>

	<div id ="displaybooks"class="container">
	<table border="2" align="center" cellpadding="5" cellspacing="5">
		<tr>
			<th> ISBN </th>
			<th> Book Title </th>
			<th> Author </th>
			<th> Edition </th>
			<th> Year </th>
			<th> Category </th>
			<th> Available </th>
		</tr>
	</div>

	<div class="container">
	<?php
			if($_SESSION["firstname"]) {
	?>
			<h2><?php echo $_SESSION["firstname"]; ?>. Please click here to <a href="logout.php" tite="Logout">Logout.</a></h2>
	<?php
	}		else echo "<h1>Please login first .</h1>";
	?>




<?php while($row = mysqli_fetch_assoc($result))
{
?>

	<tr>
		<td><?php echo $row["ISBN"];?> </td>
		<td><?php echo $row["bookTitle"];?> </td>
		<td><?php echo $row["author"];?> </td>
		<td><?php echo $row["edition"];?> </td>
		<td><?php echo $row["year"];?> </td>
		<td><?php echo $row["category"];?> </td>
		<td><?php echo $row["reserve"];?> </td>
		<!--<td><button type="button"><a href="ReserveBooks.php">Reserve</a></button>
		<!--<td><input type="submit" name="reserve" value="Reserve"></td>-->
	</tr>
</div>


<?php
}
}
		else
		echo "<center>No books found in the library by the name $search </center>" ;
?>
</table>

<form action="ReserveBooks.php" method="post">

	
	<div id="bottom">
	
		<label for="ISBN"><b>ISBN</b></label>
		<input type="text" placeholder="Enter ISBN" name="ISBN" required>
        
		<label for="username"><b>Your Username</b></label>
		<input id="username" type="text" placeholder="Enter Username" name="username" required>

		
		<button type="submit" name="submit">Reserve</button>
    
	</div>

</body>
</html>


