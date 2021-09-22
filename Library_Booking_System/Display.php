<?php
	include_once("db.php");
	

	$search = $_REQUEST["search"];

	
	$query = "select ISBM, bookTitle, author, edition, year, category, reserve from books join category on 
						books.category = category.categoryid
						where author like '$search' or bookTitle like '$search' or categoryDescription='$search'";
	$result = mysqli_query($db,$query);

	if(mysqli_num_rows($result)>0)if(mysqli_num_rows($result)>0)

	{
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
		</tr>
<?php
}
}
		else
		echo "<center>No books found in the library by the name $search </center>" ;
		header("Location: DisplayBooks.php?display=success");
	
?>
<?php

?>