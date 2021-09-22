<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>

<h2>Register For Stanley Library</h2>
<form action="Signup.php" method="post">

	<div class="imgcontainer">
		<img src="login_avatar_1.png" alt="Avatar" class="avatar">
	</div>
	
	<div id ="register "class="container">
		<label for="username"><b>Your Username</b></label>
		<input id="username" type="text" placeholder="Enter Username" name="username" required>

		<label for="password"><b>Your Password</b></label>
		<input type="password" placeholder="Enter Password" name="password" required>
	
		<label for="firstname"><b>First Name</b></label>
		<input type="text" placeholder="Enter First Name" name="firstname" required>
	
		<label for="lastname"><b>Second Name</b></label>
		<input type="text" placeholder="Enter First Name" name="lastname" required>
	
		<label for="addressline1"><b>Address Line 1</b></label>
		<input type="text" placeholder="Enter Address" name="addressline1" required>
	
		<label for="addressline2"><b>Address Line 2</b></label>
		<input type="text" placeholder="Enter Address" name="addressline2" required>
	
		<label for="city"><b>City</b></label>
		<input type="text" placeholder="Enter City" name="city" required>
	
		<label for="telephone"><b>Telephone Number</b></label>
		<input type="text" placeholder="Enter Telephone Number" name="telephone" required>
	
		<label for="mobile"><b>Mobile Number</b></label>
		<input type="text" placeholder="Enter Mobile Number" name="mobile" required>
        
		<button type="submit" name="submit">Submit</button>
    
	</div>

</form>
</body>
</html>