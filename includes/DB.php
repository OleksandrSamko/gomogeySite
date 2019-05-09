<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbName = "local_db";
//make connection
$conn = new mysqli($servername,$username,$password,$dbName);
//check
if(!$conn){
    die("Connection Faild.".mysql_connect_error());
}
?>