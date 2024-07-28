<?php

$config = require('config.php');
$db = new Database($config['database']);

$heading = 'Profile';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_FILES['user_profile_pic']['name'])) {
        $imageName = $_FILES['user_profile_pic']['name'];
        $imageSize = $_FILES['user_profile_pic']['size'];
        $tmpName = $_FILES['user_profile_pic']['tmp_name'];
        $userName = $_POST['username'];
        $userId = $_SESSION['user']['id'];

        // image validation
        $validImageExtension = ['jpg', 'jpeg', 'png'];
        $imageExtension = explode('.', $imageName);
        $imageExtension = strtolower(end($imageExtension));

        if (! in_array($imageExtension, $validImageExtension)) {
            echo
            "
            <script>
                alert('Invalid Image Extension');
                document.location.href = '/profile';
            </script>
            "
            ;
        } elseif ($imageSize > 1200000) {
            echo
            "
            <script>
                alert('Image size is too large');
                document.location.href = '/profile';
            </script/
            "
            ;
        } else {
            $newImageName = $userName . "-" . date("Y.m.d") . "-" . date("h.i.sa");
            $newImageName .= "." . $imageExtension;
            $imageNewFilePath = '/img' . '/' . $newImageName;

            $db->query('update users set username = :username,  user_profile_pic = :user_profile_pic where id = :id', [
                'username' => $userName,
                'user_profile_pic' => $imageNewFilePath,
                'id' => $userId
            ]);

            $db->query('update posts set user_profile_pic = :user_profile_pic, poster_username = :poster_username where user_id = :user_id', [
                'user_profile_pic' => $imageNewFilePath,
                'poster_username' => $userName,
                'user_id' => $userId
            ]);

            $db->query('update comments set user_profile_pic = :user_profile_pic, poster_username = :poster_username where poster_userid = :poster_userid', [
                'user_profile_pic' => $imageNewFilePath,
                'poster_username' => $userName,
                'poster_userid' => $userId
            ]);

            move_uploaded_file($tmpName, 'img/' . $newImageName);
            $_SESSION['user']['user_profile_pic'] = $imageNewFilePath; 
            $_SESSION['user']['username'] = $userName;

            echo
            "
            <script>
                document.location.href = '/profile';
            </script/
            "
            ;
        }
    }
}

require "views/profile.view.php";