<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<h1>Search Stanley Library</h2>
	
<form action = "DisplayBooks.php" method="get">
<div class="imgcontainer">
    <img src="search.png" alt="Avatar" class="avatar">
  </div>


<div class="container">
    <label for="search"><h2>Search For Book Title</h2></label>
    <input type="text" placeholder="Enter Book Title or Author" name="search" required>
	<!--<label for="category"><h2>Search By Category</h2></label>
	<input type="text" placeholder="Enter Category" name="search" required>-->
	
	
	
<label for="category"><h2>Search By Category</h2></label>
  <select class = "category" name="categoryDescription" id="category>
    <option selected value="health">Health</option>
    <option value="business">Business</option>
    <option value="biography">Biography</option>
    <option value="technolgy">Technolgy</option>
	<option value="travel">Travel</option>
	<option value="self-help">Self-Help</option>
	<option value="cookery">Cookery</option>
	<option value="fiction">Fiction</option>
	<option selected value="health">Health</option>
  </select>


    <button type="submit">Search</button>
  </div>
  
  
</form>
</body>
</html>

