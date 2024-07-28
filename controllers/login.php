<?php

require 'Core/Validator.php';

$config = require('config.php');
$db = new Database($config['database']);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    $errors = [];
    
    if (!Validator::email($email)) {
        $errors['email'] = 'Please provide a valid email address.';
    }

    if (!Validator::string($password, 7, 255)) {
        $errors['password'] = 'Invalid password.';
    }

    if (empty($errors)) {
        $user = $db->query('select * from users where email = :email AND password = :password', [
            'email' => $email,
            'password' => $password
        ])->find();

        if ($user) {
            $_SESSION['user'] = [
                'id' => $user['id'],
                'email' => $user['email'],
                'username' => $user['username'],
                'user_profile_pic' => $user['user_profile_pic']
            ];

            header('location: /');
            exit();
        } else {
            $errors['login_status'] = 'User not found or wrong password';
        }
    }
}

require 'views/login.view.php';