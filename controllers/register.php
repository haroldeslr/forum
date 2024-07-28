<?php

require 'Core/Validator.php';

$config = require('config.php');
$db = new Database($config['database']);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userName = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    $errors = [];
    if (!Validator::string($userName, 3, 20)) {
        $errors['username'] = 'Please provide a valid username minimum 3 char and max of 20 char.';
    }
    
    if (!Validator::email($email)) {
        $errors['email'] = 'Please provide a valid email address.';
    }

    if (!Validator::string($password, 7, 255)) {
        $errors['password'] = 'Please provide a password of at least seven characters.';
    }

    if (empty($errors)) {
        $user = $db->query('select * from users where email = :email', [
            'email' => $email,
        ])->find();

        if ($user) {
            $errors['signup_status'] = 'Email already exist please use another email';
        } else {
            $db->query('INSERT INTO users(username, email, password, user_profile_pic) VALUES(:username, :email, :password, :user_profile_pic)', [
                'username' => $userName,
                'email' => $email,
                'password' => $password,
                'user_profile_pic' => '/img/profile.png'
            ]);

            $newUser = $db->query('select * from users where email = :email', [
                'email' => $email
            ])->findOrFail();

            $_SESSION['user'] = [
                'id' => $newUser['id'],
                'email' => $newUser['email'],
                'username' => $newUser['username'],
                'user_profile_pic' => $newUser['user_profile_pic']
            ];
        
            header('location: /');
            exit();
        }
    }
}


require 'views/register.view.php';