<?php
    $db = mysql_connect('bts.local', 'root', '') or die(mysql_error());
    mysql_select_db('local_db') or die('Cannot select DB');
    // create table `users`(`id` int(11) not null AUTO_INCREMENT, `email` varchar(32) COLLATE utf8_unicode_ci not null default '', `username` varchar(20) COLLATE utf8_unicode_ci not null default '', `password` varchar(32) COLLATE utf8_unicode_ci not null default '', PRIMARY KEY (`id`), UNIQUE KEY `username`(`username`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
?>