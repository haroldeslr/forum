-- -------------------------------------------------------------
-- TablePlus 6.1.2(568)
--
-- https://tableplus.com/
--
-- Database: forum
-- Generation Time: 2024-07-29 02:10:40.1750
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `content` text NOT NULL,
  `user_profile_pic` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `poster_username` varchar(255) NOT NULL,
  `poster_userid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  `user_id` int NOT NULL,
  `user_profile_pic` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `poster_username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_profile_pic` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_idx` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `comments` (`id`, `post_id`, `content`, `user_profile_pic`, `date`, `poster_username`, `poster_userid`) VALUES
(28, 48, 'Test comment here', '/img/profile.png', '2024-07-29 03:24:14', 'admin', 13);

INSERT INTO `posts` (`id`, `body`, `user_id`, `user_profile_pic`, `date`, `poster_username`) VALUES
(48, 'This article will explain some of the basics of PHP and how to use it.\r\n\r\nCreate a folder.\r\n\r\nphp_test\r\nCD into the folder and create a new file inside it named:\r\n\r\ninfo.html\r\nFirst set up a basic HTML page inside of info.html.\r\n\r\n<html>\r\n  <head>\r\n</head>\r\n  <body>\r\n    <h1>hi</h1>\r\n    <form action=\"php_test.php\" method=\"post\">\r\n      First Name:\r\n      <br />\r\n      <input type=\"text\" name=\"firstname\" />\r\n      <br />\r\n      Last Name:\r\n      <br />\r\n      <input type=\"text\" name=\"lastname\" />\r\n      <br />\r\n      <input type=\"submit\" />\r\n    </form>\r\n  </body>\r\n</html>\r\nThe action inside of form lets you link the page with a PHP file. The “post” method lets it know that we will pass in data through a form.\r\n\r\nNow create a php file:\r\n\r\nphp_test.php\r\nInside of that file enter:\r\n\r\n<html>\r\n  <head>\r\n    <title>PHP INFO</title>\r\n  </head>\r\n  <body>\r\n    <?php\r\n      echo \"<p>PHP ECHO!!</>\";\r\n    ?>\r\n  </body>\r\n</html>\r\nA PHP file still follows html, but you embed PHP using:\r\n\r\n<?php\r\n?>\r\nEcho\r\nThe way you display a line is through the use of “echo”:\r\n\r\necho \"<p>PHP ECHO!!</p>\"\r\nThis will display the word “ECHO” in an HTML paragraph. You can also write it as:\r\n\r\necho \"<p>PHP ECHO!!</>\"\r\nMake sure to end every line with a “;” or things will bug out as the lines will be fused together.\r\n\r\nYou can now open your file by running:\r\n\r\nopen index.html\r\nYou will get a page that says “hi” at the top, as well as 2 bars asking for your first and last name, and a submit button.\r\n\r\nEnter anything into the bars and hit submit.\r\n\r\nYou should see a page that has your php code on it. This is not what you want.\r\n\r\nThis opens the files, but doesn’t actually run your PHPcode. So let’s fix that.\r\n\r\nIf you don’t already have PHP installed, install the latest version on this link: https://php-osx.liip.ch/.\r\n\r\nNow run your files using:\r\n\r\nphp -S localhost:8000\r\nNow on your browser, go to:\r\n\r\nhttp://localhost:8000/file_name.html\r\nie: http://localhost:8000/info.html\r\nNow if you enter some stuff and hit submit, the page will display the line “PHP ECHO!!!”\r\n\r\nSuccess! You now have a site running both your html and your php file in the background!\r\n\r\nChange the php file so that the line\r\n\r\necho \"<p>PHP ECHO!!</>\";\r\nis repeated twice. If you refresh the page, they are appropriately spaced out. This is because they are separate paragraphs.\r\n\r\necho \"<p>PHP ECHO!!</>\";\r\necho \"<p>PHP ECHO!!</>\";\r\nChange it so that instead you echo just the words in non paragraph form.\r\n\r\necho \"PHP ECHO!!\";\r\nWhen you have just one line, it looks the same.\r\n\r\necho \"PHP ECHO!!\";\r\necho \"PHP ECHO!!\";\r\nNow both lines are shown, but they are fused together next to each other.\r\n\r\nYou can space them out by using a break line.\r\n\r\necho \"PHP ECHO!!\" . \"</br>\";\r\necho \"PHP ECHO!!\" . \"</br>\";\r\nThe . in between allows you to join things together, similar to how you would normally use +. Now two separate “PHP ECHO!!” lines are displayed.\r\n\r\nUser Input/Variables\r\nA PHP script is capable of taking in user input. In our info.html file we gave the two input lines names:\r\n\r\n<input type=\"text\" name=\"firstname\" />\r\n\r\n<input type=\"text\" name=\"lastname\" />\r\nWe will use these names to indicate the inputs given. The information can be accessed using:\r\n\r\n$_POST[\'input_name\']\r\nFor example, to get the information entered in the “firstname” bar, write:\r\n\r\necho $_POST[\'firstname\'] . \"</br>\";\r\nFor the information in the “lastname” bar write:\r\n\r\necho $_POST[\'lastname\'] . \"</br>\";\r\nEnter whatever values you want for both bars, and you will see that they appear in two different lines, with the “firstname” value on top and the “lastname” value below.\r\n\r\nVariables\r\nPHP is also able to make use of variables. In the earlier section, instead of echoing the inputs for “firstname” and “lastname” directly, they can be set to a variable, and that variable be echo’ed instead.\r\n\r\nA variable is set using:\r\n\r\n$variableName = value;\r\nTo set two variables equal to the two inputs, you can use:\r\n\r\n$firstName = $_POST[\'firstname\'];\r\n$lastName = $_POST[\'lastname\'];\r\nYou will then change the echoes to:\r\n\r\necho $firstName . \"</br>\";\r\necho $lastName . \"</br>\";\r\nThis gives the same result as earlier if you enter some values and hit submit.\r\n\r\nYou can also make a long string by doing:\r\n\r\n$variableName = <<<EOD\r\n   mumbo\r\n   jumbo\r\n   jambo\r\nEOD;\r\nEverything inside the EOD will count as one long continuous sentence/paragraph. Lines can be separated using </br>. Note that there cannot be any spaces before the second “EOD”.\r\n\r\nFor our above example if you add the following lines:\r\n\r\n$str = <<<EOD\r\n      The customers name is\r\n      $firstName and they are\r\n      of the $lastName clan </br>\r\n      mumbo jumbo\r\nEOD;\r\necho $str;\r\nIt will also print out the sentence:\r\n\r\nThe customers name is firstName and they are of the lastName clan.\r\nmumbo jumbo\r\nYou can define a constant using:\r\n\r\ndefine(constantName, constantValue)\r\nie: define (highestScore, \"100\")\r\nAdd a new sentence:\r\n\r\necho \"The highest possible score on a test is\" . highestScore;\r\nThe page should now read:\r\n\r\n\"The highest possible score on a test is 100\"\r\nMath\r\nPHP is also capable of doing math.\r\n\r\necho 5 + 2 . \"</br>\";\r\necho 5 / 2 . \"</br>\";\r\nIf you add this line, the screen prints out a 7 and a 2.5.\r\n\r\nIf you want the result as a certain data type you can add it in front using a (dataType ).\r\n\r\necho (integer)(5 / 2) . \"</br>\";\r\nHere the result of 5/2, which is 2.5, is converted into an integer, so on your screen you should see a 2.\r\n\r\nLoops\r\nLoops can be used by inserting the echo statements after the conditions.\r\n\r\nif(1 > 2){\r\n  echo \'1 > 2\' . \"</br>\";\r\n} else {\r\n  echo \'1 < 2\' . \"</br>\";\r\n}\r\nThe if statement will be checked and if a condition is met the echo code will be printed on the screen. Here you should see: 1 < 2\r\n\r\nA case statement can similarly be used. Write the following code:\r\n\r\n$firstName = $_POST[\'firstname\'];\r\nswitch($firstName){\r\n  case \"first\" :\r\n    echo \"HELLO FIRST\" . \"</br>\";\r\n    break;\r\n  case \"durr\" :\r\n    echo \"HELLO DURR\" . \"</br>\";\r\n    break;\r\n  default :\r\n    echo \"hey my dude\" . \"</br>\";\r\n    break;\r\n}\r\nHere we set the variable firstName equal to your input in the first box. If you enter “first” as your first name the screen will show “HELLO FIRST”. If you put “durr” as your first name the screen will show “HELLO DURR”. Otherwise if you enter anything else the screen will just show “hey my dude”.\r\n\r\nYou can use can put an echo inside of a while loop to have the screen show multiple lines, one for each time the loop runs.\r\n\r\n$num = 0;\r\n  while($num < 10){\r\n    echo $num . \"</br>\";\r\n    ++$num\r\n}\r\nThis loop will print a line showing the value of num, then increment 1, and repeat until num is no longer smaller than 10. As a result the screen will show the numbers 0 through 9 each on a separate line.\r\n\r\nArrays\r\nYou can create an array by doing:\r\n\r\n$varName = array(item1, item2, item 3);\r\nYou can replace an item in the array with:\r\n\r\n$varName[index] = newItem\r\nYou can add to it instead by making the index bigger than any used.\r\n\r\nAdd the following lines.\r\n\r\n$favoriteFoods = array(\'pizza\', \'PIZZA\', \'XL-PIZZA\', \'XLSUPREMEEVERYTHINGONTOPPIZZA\');\r\n$favoriteFoods[4] = \'diet salad\';\r\necho $favoriteFoods . \"</br>\";\r\necho \"My favorite food  is \" . $favoriteFoods[0] . \"</br>\";\r\necho \"My last favorite food  is \" . $favoriteFoods[4] . \"</br>\";\r\nWe create an array of our favorite foods, which may or may not be biased towards pizza. We add an extra ‘diet salad’ to the array. The first echo just prints out the data type: ‘array’. But the other two print out the first and last items in the array by using their indexes.\r\n\r\nYou can go through all of the items in the array and print them by doing:\r\n\r\nforEach(arrayName as item){\r\n  echo $item;\r\n}\r\nIf you copy down the following line:\r\n\r\nforEach($favoriteFoods as $food){\r\n  echo $food . \"</br>\";\r\n}\r\nThe screen will now also have a line for each food in the favoriteFoods array.\r\n\r\nThe word you use after “arrayName as” doesn’t actually matter, so long as you are consistent with using the word in the line afterwards. Obviously it helps to make it a meaningful word though, like an item from an array of foods would be one singular food.\r\n\r\nThese are the basic of PHP! You now know how to connect a PHP file to an html file, how to actually run the site with a a working php file, and what you can do with a PHP file, including how it can interact with user input. Thank you for reading, and have fun using PHP!', 13, '/img/profile.png', '2024-07-29 03:23:49', 'admin');

INSERT INTO `users` (`id`, `username`, `email`, `password`, `user_profile_pic`) VALUES
(13, 'admin', 'admin@gmail.com', '1234567', '/img/profile.png');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;