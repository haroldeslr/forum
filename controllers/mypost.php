<?php

$config = require('config.php');
$db = new Database($config['database']);

$userId = $_SESSION['user']['id'];
$heading = 'My Post';

$myposts = $db->query('select * from posts where user_id = :user_id order by date DESC', [
    'user_id' => $userId
])->get();

require "views/mypost.view.php";