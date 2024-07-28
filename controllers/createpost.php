<?php

require 'Core/Validator.php';

$config = require('config.php');
$db = new Database($config['database']);

$userId = $_SESSION['user']['id'];
$userProfilePic = $_SESSION['user']['user_profile_pic'];
$posterUsername = $_SESSION['user']['username'];

$heading = 'Create Post';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $errors = [];

    if (! Validator::string($_POST['body'], 1, 10000)) {
        $errors['body'] = 'A post of no more than 5,000 characters is required';
    }

    if (empty($errors)) {
        $db->query('INSERT INTO posts(body, user_id, user_profile_pic, poster_username) VALUES(:body, :user_id, :user_profile_pic, :poster_username)', [
            'body' => $_POST['body'],
            'user_id' => $userId,
            'user_profile_pic' => $userProfilePic,
            'poster_username' => $posterUsername
        ]);

        header('location: /mypost');
        exit();
    }
}

require 'views/createpost.view.php';