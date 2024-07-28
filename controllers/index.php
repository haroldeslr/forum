<?php

$config = require('config.php');
$db = new Database($config['database']);

$heading = 'Home';

$posts = $db->query('select * from posts order by date DESC')->get();

require "views/index.view.php";