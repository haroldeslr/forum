<?php

require 'Core/Validator.php';

$config = require('config.php');
$db = new Database($config['database']);

$heading = 'Post';

$postId = $_GET['id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userProfilePic = $_SESSION['user']['user_profile_pic'];
    $posterUsername = $_SESSION['user']['username'];
    $userId = $_SESSION['user']['id'];

    $errors = [];

    if (! Validator::string($_POST['content'], 1, 500)) {
        $errors['content'] = 'A comment of no more than 500 characters is required';
    }

    if (empty($errors)) {
        $db->query('INSERT INTO comments(post_id, content, user_profile_pic, poster_username, poster_userid) VALUES(:post_id, :content, :user_profile_pic, :poster_username, :poster_userid)', [
            'post_id' => $postId,
            'content' => $_POST['content'],
            'user_profile_pic' => $userProfilePic,
            'poster_username' => $posterUsername,
            'poster_userid' => $userId
        ]);

        header("location: /post?id={$postId}");
        exit();
    }
} else {
    $post = $db->query('select * from posts where id = :id', [
        'id' => $postId
    ])->findOrFail();

    $comments = $db->query('select * from comments where post_id = :post_id order by date DESC', [
        'post_id' => $postId
    ])->get();
}

require "views/post.view.php";