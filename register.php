<?php require_once("includes/connection.php"); ?>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="utf-8"> 
 <title> Реєстрація</title>
<link href="css/style.css" media="screen" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'rel='stylesheet' type='text/css'>
	</head>
	<body>
<div class="container mregister">
<div id="login">
 <h1>Реєстрація</h1>
<form action="register.php" id="registerform" method="post" name="registerform">
 <p><label for="user_login">Повне імя<br>
 <input class="input" id="full_name" name="full_name"size="32"  type="text" value=""></label></p>
<p><label for="user_pass">E-mail<br>
<input class="input" id="email" name="email" size="32"type="email" value=""></label></p>
<p><label for="user_pass">Імя користувача<br>
<input class="input" id="username" name="username"size="20" type="text" value=""></label></p>
<p><label for="user_pass">Пароль<br>
<input class="input" id="password" name="password"size="32"   type="password" value=""></label></p>
<p class="submit"><input class="button" id="register" name= "register" type="submit" value="Зареєструватися"></p>
	  <p class="regtext">Вже зареєстровані? <a href= "login.php">Введіть імя користувача</a>!</p>
 </form>
</div>
</div>
<footer>
© 2019 . .
 </footer>
</body>
</html>
<?php
	
	if(isset($_POST["register"])){
	
	if(!empty($_POST['full_name']) && !empty($_POST['email']) && !empty($_POST['username']) && !empty($_POST['password'])) {
  $full_name= htmlspecialchars($_POST['full_name']);
	$email=htmlspecialchars($_POST['email']);
 $username=htmlspecialchars($_POST['username']);
 $password=htmlspecialchars($_POST['password']);
 $query=mysql_query("SELECT * FROM `users` WHERE username='".$username."'");
  $numrows=mysql_num_rows($query);
if($numrows==0)
   {
	$sql="INSERT INTO `users` (`full_name`, `email`, `username`, `password`) VALUES('$full_name','$email', '$username', '$password')";
  $result=mysql_query($sql);
 if($result){
	$message = "Account Successfully Created";
} else {
 $message = "Failed to insert data information!" . mysql_error();
  }
	} else {
	$message = "That username already exists! Please try another one!";
   }
	} else {
	$message = "All fields are required!";
	}
	}
	?>
<?php if (!empty($message)) 
{
    echo "<p class='error'>" . "MESSAGE:" . $message. "</p>";
    } ?>
