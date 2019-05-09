<?php
echo "submit";

$name = $_POST['name'];
$email = $_POST['email'];
$concertId = $_POST['concertId'];
$kilk = $_POST['kilk'];

require_once('includes/DB.php');

//get id
$sql = "SELECT `id_user`,`full_name`,`email` FROM `users`
	WHERE (`email` = '$email')";
$result = $conn->query($sql);
if ($result->num_rows <= 0) {
//set user
    $sql = "INSERT INTO `users` (full_name, email)
VALUES ('$name','$email')";
    $result = $conn->query($sql);
    if($result){
        //get id data
        $sql = "SELECT `id_user`,`full_name`,`email` FROM `users`
	WHERE (`email` = '$email')";
        $result = $conn->query($sql);
    }
}

$userData = $result->fetch_assoc();

//get concert data
$sql = "SELECT `id_conc`, `name`, `id_place`, `data`, `cena` FROM `concerts`
	WHERE (`id_conc` = $concertId)";
$result = $conn->query($sql);
if ($result->num_rows <= 0) {
    throw new Exception("false\n" . $sql . "\n" . $conn->error);
}
$concertData = $result->fetch_assoc();

$suma = ($concertData['cena'] * $kilk);
//create ticket
$sql = "INSERT INTO `tickets` (`id_user`,`id_conc`,`id_place`,`data`,`kilk`,`sum`) VALUES(" . $userData['id_user'] . "," . $concertData['id_conc'] . "," . $concertData['id_place'] . ",'" . $concertData['data'] . "'," . $kilk . "," . $suma . ")";

$result = $conn->query($sql);

?>

<html>
<head>
    <meta http-equiv="content-type" content="text/html"/>
    <meta name="bts" content="k_pop"/>
    <meta charset="utf-8"/>

    <title>BTS</title>
    <link rel="stylesheet" href="css/menu.css"/>
    <link rel="icon" href="images/icon.png"/>
    <link href="css/style.css" media="screen" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'/>
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
                <input class="input" id="username" name="username" size="20" type="text" value=""/></label></p>
        <p><label for="user_pass">Пароль<br/>
                <input class="input" id="password" name="password" size="20" type="password" value=""/></label></p>
        <p class="submit"><input class="button" name="login" type="submit" value="Log In"/></p>
        <p class="regtext">Ще не зареєстровані?<a href="register.php">Реєстрація</a>!</p>
    </form>
</div>
</body>

<body link="black" vlink="black" alink="black">
<div class="main2">
    <table width="72%" align="center" cellspacing="2" cellpadding="1">
        <col style="width:20%" span="5"/>
        <strong>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr>
                <th align="center"><a style="text-decoration: none;" href="index.php"><h2
                                style="text-shadow: darkblue 0 0 3px;">Главная</h2></a></th>
                <th align="center"><a style="text-decoration: none;" href="history.htm"><h2
                                style="text-shadow: darkblue 0 0 3px; ">История</h2></a></th>
                <th align="center"><a style="text-decoration: none;" href="tickets.php"><h2
                                style="text-shadow: darkblue 0 0 3px;">Концерты</h2></a></th>
                <th align="center"><a style="text-decoration: none;" href="info.htm"><h2
                                style="text-shadow: darkblue 0 0 3px;">Инфо</h2></a></th>
                <th align="center"><a style="text-decoration: none;" href="media.htm"><h2
                                style="text-shadow: darkblue 0 0 3px;">Медиа</h2></a></th>
            </tr>
        </strong>
    </table>
</div>
<?php
if ($result !== TRUE) {
    echo '<p>Sorry, bad</p>';
    exit();
}
echo '<p>Ваш тикет</p>'
    . '<p>Имя: ' . $userData['full_name'] . '</p>'
    . 'email: ' . $userData['email'] . '</p>'
    . 'Назва концерту: ' . $concertData['name'] . '</p>'
    . 'Дата: ' . $concertData['data'] . '</p>'
    . 'Количество:' . $kilk . '</p>'
    . 'Цена: $' . $concertData['cena'] . '</p>'
    . 'Сума: $ ' . $suma . '</p>';
?>

</body>
</html>