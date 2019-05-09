<html>
<head>
	<meta http-equiv="content-type" content="text/html" />
	<meta name="bts" content="k_pop" />
    <meta charset="utf-8"/>

	<title>BTS</title>
 <link rel="stylesheet" href="css/menu.css"/>
  <link rel="icon" href="images/icon.png"/>
  <link href="css/style.css" media="screen" rel="stylesheet"/>
<link href= 'http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>
</head> 
    <style>
    body {
 margin: 0; /* Убираем отступы */
    height: 100%; /* Высота страницы */
    background: url(images/header.jpg) no-repeat,
    url(images/fon.jpg) repeat-y;
    -moz-background-size: 100%; /* Firefox 3.6+ */
    -webkit-background-size: 100%; /* Safari 3.1+ и Chrome 4.0+ */
    -o-background-size: 100%; /* Opera 9.6+ */
    background-size: 100%; /* Современные браузеры */
    }
</style>
    
</head>

<body>
<div class="reg">
<h1>Вхід</h1>
<form class="squarel1" name="f1" method="post" action="">
<p><label for="user_login">Імя користувача<br/>
<input class="input" id="username" name="username"size="20" type="text" value=""/></label></p>
<p><label for="user_pass">Пароль<br/>
 <input class="input" id="password" name="password"size="20" type="password" value=""/></label></p> 
	<p class="submit"><input class="button" name="login"type= "submit" value="Log In"/></p>
	<p class="regtext">Ще не зареєстровані?<a href= "register.php">Реєстрація</a>!</p>
   </form>
   </div>
</body>

<body link="black" vlink="black" alink="black" >
<div class="main2">
<table width="72%" align="center" cellspacing="2" cellpadding="1" >
<col style="width:20%" span="5"/>
<strong>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr>
<th align="center"><a style="text-decoration: none;" href="index.php"><h2 style="text-shadow: darkblue 0 0 3px;">Главная</h2></a></th>
<th align="center"><a style="text-decoration: none;" href="history.htm"><h2 style="text-shadow: darkblue 0 0 3px; ">История</h2></a></th>
<th align="center"><a style="text-decoration: none;" href="tickets.php"><h2 style="text-shadow: darkblue 0 0 3px;">Концерты</h2></a></th>
<th align="center"><a style="text-decoration: none;" href="info.htm"><h2 style="text-shadow: darkblue 0 0 3px;">Инфо</h2></a></th>
<th align="center"><a style="text-decoration: none;" href="media.htm"><h2 style="text-shadow: darkblue 0 0 3px;">Медиа</h2></a></th>
</tr>
</strong>
</table>
</div>
</body>

<?php
	session_start();
	?>
<?php require_once("includes/connection.php");?>
<?php
		if(isset($_SESSION["session_username"]))
        {	
	header("Location: /");
	}
	if(isset($_POST["login"]))
    {
	if(!empty($_POST['username']) && !empty($_POST['password'])) {
	$username=htmlspecialchars($_POST['username']);
	$password=htmlspecialchars($_POST['password']);
	$query =mysql_query("SELECT * FROM `users` WHERE username='".$username."' AND password='".$password."'");
	$numrows=mysql_num_rows($query);
	if($numrows!=0)
 {
while($row=mysql_fetch_assoc($query))
 {
	$dbusername=$row['username'];
	$dbpassword=$row['password'];
	$dbfullname = $row['full_name'];
	$dbemail = $row['email'];
 }
  if($username == $dbusername && $password == $dbpassword)
 {
	 $_SESSION['session_username']=$username;	 
	 $_SESSION['session_fullname']=$dbfullname;	 
	 $_SESSION['session_email']	= $dbemail; 
   header("Location: /");
	}
	} else 
    {	
    	echo  "Invalid username or password!";
 }
	} else {
    $message = "All fields are required!";
	}
	}
	?>

